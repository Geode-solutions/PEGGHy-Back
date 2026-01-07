# Third parties
from opengeodeweb_back.app import app, run_server

from pegghy_back.routes import blueprint_pegghy

app.register_blueprint(
    blueprint_pegghy.routes,
    url_prefix="/pegghy_back",
    name="pegghy_back",
)


def run_pegghy_server() -> None:
    run_server()


if __name__ == "__main__":
    run_pegghy_server()
