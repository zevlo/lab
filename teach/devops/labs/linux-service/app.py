#!/usr/bin/env python3

import json
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer


HOST = "127.0.0.1"
PORT = int(os.environ.get("PORT", "8080"))
VERSION = os.environ.get("APP_VERSION", "unknown")


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path != "/healthz":
            self.send_response(404)
            self.end_headers()
            return

        body = json.dumps(
            {
                "status": "ok",
                "version": VERSION,
                "pid": os.getpid(),
            }
        ).encode()

        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, _format, *args):
        request_line, status, size = args
        print(
            f'request client={self.client_address[0]} '
            f'line="{request_line}" status={status} bytes={size}',
            flush=True,
        )


print(
    f"starting pid={os.getpid()} address={HOST}:{PORT} version={VERSION}",
    flush=True,
)
ThreadingHTTPServer((HOST, PORT), Handler).serve_forever()
