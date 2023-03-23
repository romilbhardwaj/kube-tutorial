# Runs a webserver on the specified port and returns hello world

import argparse
import socket

from flask import Flask

app = Flask(__name__)
hostname = socket.gethostname()

@app.route('/')
def index():
    return f'Hello Sky Computing Lab! My hostname is {hostname}'


def parse_args():
    parser = argparse.ArgumentParser(
        description='Run a simple webserver.')
    parser.add_argument('port', type=int, default=8000)
    return parser.parse_args()


def main():
    args = parse_args()
    print(f'I am {hostname}, Running webserver on port {args.port}')
    app.run(host='0.0.0.0', port=args.port)


if __name__ == '__main__':
    main()
