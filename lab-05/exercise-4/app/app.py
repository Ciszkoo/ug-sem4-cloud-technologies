from flask import Flask, jsonify
import os

PORT = os.getenv('PORT')

app = Flask(__name__)


@app.route('/')
def hello_world():
    data_dir = '/data'
    data_file = os.path.join(data_dir, 'data.txt')

    with open(data_file, 'w') as f:
        f.write('Hello world!')

    return jsonify({'message': f'Hello World! Data was saved in: ${data_file}.'})


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=PORT)
