#!/bin/bash
# ──────────────────────────────────────────────────────────────
# Pixel Art for Games — Masterclass · LAUNCHER
# Double-click this file to start the course.
#   (First time only: right-click → Open to approve it, then Open.)
# It starts a small local server and opens the course in your browser,
# so your progress saves automatically to progress.json in this folder.
# Keep the Terminal window open while you study. Press Ctrl+C to stop.
# Requires Python 3 (preinstalled on macOS).
# ──────────────────────────────────────────────────────────────
cd "$(dirname "$0")" || exit 1
PORT=8000
( sleep 1; open "http://localhost:$PORT/index.html" 2>/dev/null ) &
exec python3 - "$PORT" <<'PYEOF'
import sys, json
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer

PORT = int(sys.argv[1]) if len(sys.argv) > 1 else 8000

class Handler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-store')
        super().end_headers()

    def do_POST(self):
        # Only endpoint: POST /save  -> write the body to progress.json (this folder)
        if self.path.split('?')[0] == '/save':
            try:
                n = int(self.headers.get('Content-Length', 0))
                data = json.loads(self.rfile.read(n).decode('utf-8'))
                if not isinstance(data, dict) or not isinstance(data.get('completed'), dict):
                    raise ValueError('unexpected shape')
                with open('progress.json', 'w') as f:
                    json.dump(data, f, indent=2)
                self.send_response(200); self.send_header('Content-Type', 'application/json'); self.end_headers()
                self.wfile.write(b'{"ok":true}')
            except Exception:
                self.send_response(400); self.send_header('Content-Type', 'application/json'); self.end_headers()
                self.wfile.write(b'{"ok":false}')
        else:
            self.send_response(404); self.end_headers()

try:
    print("Pixel Art Masterclass running at  http://localhost:%d" % PORT)
    print("Keep this window open while you study. Press Ctrl+C to stop.")
    ThreadingHTTPServer(('127.0.0.1', PORT), Handler).serve_forever()
except KeyboardInterrupt:
    print("\nStopped.")
