# Standard library imports
import json
from pathlib import Path

# Third party imports
import flask
import flask_cors  # type: ignore[import-untyped]

schemas = Path(__file__).parent / "schemas"

with (schemas / "healthcheck.json").open() as file:
    healthcheck_json = json.load(file)

routes = flask.Blueprint("pegghy_routes", __name__)
flask_cors.CORS(routes)


@routes.route(healthcheck_json["route"], methods=healthcheck_json["methods"])
def healthcheck() -> flask.Response:
    return flask.make_response({"message": "healthy"}, 200)
