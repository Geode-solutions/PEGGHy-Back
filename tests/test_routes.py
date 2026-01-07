from flask.testing import FlaskClient


def test_allowed_files(client: FlaskClient) -> None:
    route = f"/opengeodeweb_back/allowed_files"
    response = client.post(route)
    assert response.status_code == 200


def test_root(client: FlaskClient) -> None:
    route = f"/"
    response = client.post(route)
    assert response.status_code == 200


def test_healthcheck(client: FlaskClient) -> None:
    route = f"/pegghy_back/healthcheck"
    response = client.get(route)
    assert response.status_code == 200
    assert response.json is not None
    message = response.json["message"]
    assert type(message) is str
    assert message == "healthy"
