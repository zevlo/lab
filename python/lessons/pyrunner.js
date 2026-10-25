// pyrunner.js — in-browser Python runner for the exercises (Pyodide, loaded from CDN on first Run)
(function () {
  var CDN = "https://cdn.jsdelivr.net/pyodide/v0.26.4/full/";

  var style = document.createElement("style");
  style.textContent = [
    ".py-editor { margin-top:18px; border:1px solid #30363d; border-radius:10px; overflow:hidden; background:#0a0e14; }",
    ".py-editor textarea { display:block; width:100%; min-height:240px; background:#0a0e14; color:#c9d1d9; border:none; outline:none; resize:vertical; padding:14px 16px; font:13.5px/1.6 'SF Mono',SFMono-Regular,Consolas,Menlo,monospace; white-space:pre; tab-size:4; caret-color:#58a6ff; }",
    ".py-editor .toolbar { display:flex; align-items:center; gap:10px; padding:8px 12px; border-top:1px solid #30363d; background:#161b22; flex-wrap:wrap; }",
    ".py-editor button { background:#21262d; color:#58a6ff; border:1px solid #30363d; border-radius:6px; padding:6px 14px; font-weight:600; font-size:13px; cursor:pointer; }",
    ".py-editor button:hover { border-color:#58a6ff; }",
    ".py-editor button:disabled { opacity:.55; cursor:wait; }",
    ".py-editor .meta { color:#8b949e; font-size:12.5px; }",
    ".py-editor .console { margin:0; border:none; border-top:1px solid #30363d; border-radius:0; min-height:22px; }",
    ".py-editor .console code { color:#7ee787; }",
    ".py-editor .console.error { border-left:4px solid #f85149; }",
    ".py-editor .console.error code { color:#ffa198; }"
  ].join("\n");
  document.head.appendChild(style);

  var SERVERS_JSON = JSON.stringify({
    servers: [
      { name: "web-01",     host: "127.0.0.1",     env: "prod",    cpu_usage: 72 },
      { name: "web-02",     host: "127.0.0.1",     env: "prod",    cpu_usage: 45 },
      { name: "staging-01", host: "localhost",     env: "staging", cpu_usage: 12 },
      { name: "db-01",      host: "localhost",     env: "prod",    cpu_usage: 91 },
      { name: "db-02",      host: "db-02.invalid", env: "prod",    cpu_usage: 8 }
    ]
  }, null, 2) + "\n";

  // Simulated subprocess for Lesson 6: "ping" to *.invalid fails, everything else passes.
  var MOCK_SUBPROCESS = [
    "import sys, types",
    "class CompletedProcess:",
    "    def __init__(self, args, returncode=0, stdout='', stderr=''):",
    "        self.args, self.returncode = args, returncode",
    "        self.stdout, self.stderr = stdout, stderr",
    "class CalledProcessError(Exception):",
    "    def __init__(self, returncode, cmd):",
    "        self.returncode, self.cmd = returncode, cmd",
    "        super().__init__('Command returned non-zero exit status ' + str(returncode))",
    "class TimeoutExpired(Exception):",
    "    def __init__(self, cmd, timeout):",
    "        self.cmd, self.timeout = cmd, timeout",
    "        super().__init__('timed out after ' + str(timeout) + ' seconds')",
    "def run(cmd, capture_output=False, text=False, check=False, timeout=None, **kw):",
    "    if isinstance(cmd, list) and len(cmd) > 1 and cmd[0] == 'ping':",
    "        host = str(cmd[-1])",
    "        if host.endswith('.invalid'):",
    "            if check: raise CalledProcessError(68, cmd)",
    "            return CompletedProcess(cmd, 68, '', 'ping: cannot resolve ' + host)",
    "        return CompletedProcess(cmd, 0, '64 bytes from ' + host, '')",
    "    return CompletedProcess(cmd, 0, '', '')",
    "_m = types.ModuleType('subprocess')",
    "_m.CompletedProcess, _m.CalledProcessError = CompletedProcess, CalledProcessError",
    "_m.TimeoutExpired, _m.run = TimeoutExpired, run",
    "sys.modules['subprocess'] = _m"
  ].join("\n");

  var pyodidePromise = null;
  function loadScript(src) {
    return new Promise(function (res, rej) {
      var s = document.createElement("script");
      s.src = src;
      s.onload = res;
      s.onerror = function () { rej(new Error("could not fetch " + src)); };
      document.head.appendChild(s);
    });
  }
  function getPyodide() {
    if (!pyodidePromise) {
      pyodidePromise = loadScript(CDN + "pyodide.js").then(function () {
        return loadPyodide({ indexURL: CDN });
      });
    }
    return pyodidePromise;
  }

  function setupPy(py, mode) {
    if (mode === "json" || mode === "subprocess") {
      py.FS.writeFile("servers.json", SERVERS_JSON, { encoding: "utf8" });
    }
    if (mode === "subprocess") {
      py.runPython(MOCK_SUBPROCESS);
    }
  }

  function run(box, ta, out, btn, mode) {
    btn.disabled = true;
    out.classList.remove("error");
    out.textContent = "Loading Python runtime... first run only, ~10 MB. Subsequent runs are fast.\n";
    getPyodide().then(function (py) {
      setupPy(py, mode);
      var buf = "";
      py.setStdout({ batched: function (s) { buf += s + "\n"; } });
      py.setStderr({ batched: function (s) { buf += s + "\n"; } });
      var p;
      try {
        p = py.runPythonAsync(ta.value);
        return p.then(function () {
          out.textContent = buf || "(no output -- did you print anything?)";
        });
      } catch (err) {
        out.textContent = (buf ? buf + "\n" : "") + err;
        out.classList.add("error");
        return Promise.resolve();
      }
    }).catch(function (err) {
      out.textContent =
        "Could not run Python in the browser (" + err + ").\n\n" +
        "Offline? Copy your code into ex.py and run:  python3 ex.py";
      out.classList.add("error");
    }).finally(function () {
      btn.disabled = false;
    });
  }

  function wire(box) {
    var ta = box.querySelector("textarea");
    var out = box.querySelector(".console");
    var btn = box.querySelector("[data-run]");
    var reset = box.querySelector("[data-reset]");
    var mode = box.getAttribute("data-setup") || "";
    var starter = ta.value;
    var key = "pyrunner:" + location.pathname + ":" + (box.getAttribute("data-id") || ta.id || "code");

    var saved = null;
    try { saved = localStorage.getItem(key); } catch (e) {}
    if (saved !== null && saved !== starter) ta.value = saved;
    try { localStorage.setItem(key, ta.value); } catch (e) {}

    ta.addEventListener("input", function () {
      try { localStorage.setItem(key, ta.value); } catch (e) {}
    });
    ta.addEventListener("keydown", function (e) {
      if (e.key === "Tab") {
        e.preventDefault();
        var s = ta.selectionStart, en = ta.selectionEnd;
        ta.value = ta.value.slice(0, s) + "    " + ta.value.slice(en);
        ta.selectionStart = ta.selectionEnd = s + 4;
      }
    });
    btn.addEventListener("click", function () { run(box, ta, out, btn, mode); });
    reset.addEventListener("click", function () {
      ta.value = starter;
      try { localStorage.removeItem(key); } catch (e) {}
      out.textContent = "Output appears here when you press Run.";
      out.classList.remove("error");
    });
  }

  document.querySelectorAll(".py-editor").forEach(wire);
})();
