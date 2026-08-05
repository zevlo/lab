# L0022 complete 4/4; asked real use of bash -c

User finished Lesson 0022 quiz 4/4, drills good. Follow-up: main real use case of `bash -c` (not the env-inheritance lab trick).

**Implications:** Env/`export`/one-shot/`unset`/`printenv` floor set. `bash -c` grounded as one-shot child bash for a command string (ssh/cron/docker/CI/find -exec). Next CLE slice: return codes `&&`/`||`/`$?` (MS order), or SSH.
