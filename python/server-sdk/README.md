This README walks through the setup of a server for locally testing Miru callbacks.


# Create the Flask Application
This is a sample flask application which shows how to verify a callback request using the Miru server-side side SDK.

1. Navigate to the `../python/server-sdk` directory inside this repository

1. Create a virtual environment 

    `python3 -m venv .venv`

1. Activate the environment

    `source .venv/bin/activate`

1. Install the dependencies

    `python3 -m pip install -r requirements.txt`

1. Run the application
    `cd flask`
    `python3 app.py`

1. Verify it's running by going to `http://localhost:5000` in your browser. You should see 

    `{"message":"ok"}`
 

# Forward a Domain with `ngrok`

Miru callbacks don't support sending requests to your local machine; requests must be sent to valid domains over HTTPS. To test Miru callbacks locally, we'll need to setup tunneling with `ngrok`.

1. Navigate to [ngrok](https://ngrok.com/) and create an account

1. Navigate to the [setup page](https://dashboard.ngrok.com/get-started/setup/linux)

1. Install `ngrok` to your machine according to their [installation instructions](https://dashboard.ngrok.com/get-started/setup/linux) and add your authoken to the `ngrok` configuration file.

1. Forward an ephemeral domain to your Flask application over on port 5000

    `ngrok http http://localhost:5000`

    You should see a domain similar to `https://c1971566f336.ngrok-free.app` being forward to your Flask server.

# Create the Callback in Miru

1. Navigate to the [callbacks page](https://configs.miruml.com/callbacks) in Miru

2. Add your ephemeral ngrok domain with the `/callback` route (e.g. `https://c1971566f336.ngrok-free.app/callback`) to the callback endpoint in the dashboard.

3. Create a callback secret by clicking the Generate Secret button. 

    Store your secret in a secrets manager or other secure location to inject into your application. The secret will functionally replace the `SECRET` variable in the sample flask application. However, be very careful not expose your secret or store it in git! The usage of the `SECRET` variable is only for demo purposes and is not secure.


Your callback is now ready for local testing! Upon any new config instance deployments, Miru will send a validation request to your server before allowing the deployment to occur.