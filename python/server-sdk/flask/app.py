from flask import Flask, request, jsonify, Response
from miru_server_sdk.callbacks import Callback, CallbackVerificationError

app = Flask(__name__)

# do not place secrets directly in code, this is only for demo purposes
SECRET = "cbsec_WycPjK+LHQw5hbeL1qcLOGjXsIWYuGzEUrwUZWNz4W4="


@app.route("/callback", methods=["POST"])
def callback_endpoint() -> tuple[Response, int]:
    print("Callback received")

    headers = dict(request.headers)
    payload = request.get_data()

    # verify the callback
    try:
        cb = Callback(SECRET)
        cfgInstDeployment = cb.verify(payload, headers)
    except CallbackVerificationError as e:
        return jsonify({
            'valid': False,
            'message': str(e),
            'errors': []
        }), 400

    # TODO: check if the config instances being deployed are valid
    print(cfgInstDeployment)

    # return a valid response
    return jsonify({
        'valid': True,
        'message': 'valid config instance deployment',
        'errors': []
    }), 200


@app.route("/", methods=["GET"])
def health_check() -> tuple[Response, int]:
    return jsonify({
        'message': 'ok'
    }), 200


if __name__ == "__main__":
    app.run()
