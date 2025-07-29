from flask import Flask, request, jsonify, Response
from miru_server_sdk.webhooks import Webhook, WebhookVerificationError

app = Flask(__name__)

# do not place secrets directly in code, this is only for demo purposes
SECRET = "whsec_XRmIwf3AIzFKZaW1TrJv02gl1UZMXBHK"


@app.route("/webhooks/miru", methods=["POST"])
def webhook_endpoint() -> tuple[Response, int]:
    print("Webhook received")

    headers = dict(request.headers)
    payload = request.get_data()

    try:
        wh = Webhook(SECRET)
        webhookPayload = wh.verify(payload, headers)
    except WebhookVerificationError as e:
        return jsonify({
            'valid': False,
            'message': str(e),
            'errors': []
        }), 400

    # TODO: check if the webhook payload is valid
    print(webhookPayload)

    # return a valid response
    return jsonify({'message': 'webhook successfully received'}), 200


@app.route("/", methods=["GET"])
def health_check() -> tuple[Response, int]:
    return jsonify({'message': 'ok'}), 200


if __name__ == "__main__":
    app.run()
