# Standard library imports
import os

# Third party imports
import flask
import flask_cors
import json

schemas = os.path.join(os.path.dirname(__file__), "schemas")

with open(os.path.join(schemas, "healthcheck.json"), "r") as file:
    healthcheck_json = json.load(file)

routes = flask.Blueprint("pegghy_routes", __name__)
flask_cors.CORS(routes)


@routes.route(healthcheck_json["route"], methods=healthcheck_json["methods"])
def healthcheck():
    return flask.make_response({"message": "healthy"}, 200)
