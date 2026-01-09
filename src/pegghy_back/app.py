# Third parties
import flask
from opengeodeweb_back.app import create_app, run_server, register_ogw_back_blueprints

# Local application imports
from pegghy_back.routes import blueprint_pegghy


def run_pegghy_server() -> flask.Flask:
    app = create_app(__name__)
    register_ogw_back_blueprints(app)
    app.register_blueprint(
        blueprint_pegghy.routes,
        url_prefix="/pegghy_back",
        name="pegghy_back",
    )
    run_server(app)
    return app


if __name__ == "__main__":
    run_pegghy_server()
