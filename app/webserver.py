# Runs a webserver on the specified port which returns hello world

import argparse
from http import HTTPStatus
from http.server import HTTPServer, SimpleHTTPRequestHandler


def parse_args():
    parser = argparse.ArgumentParser(
        description='Run a simple webserver.')
    parser.add_argument('port', type=int, default=8000)
    return parser.parse_args()


class HelloWorldHandler(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(HTTPStatus.OK)
        self.end_headers()
        self.wfile.write(b'Hello world')


def main():
    args = parse_args()
    print(f'Running webserver on port {args.port}')
    server_address = ('localhost', args.port)
    httpd = HTTPServer(server_address, HelloWorldHandler)
    httpd.serve_forever()


if __name__ == '__main__':
    main()
