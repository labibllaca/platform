from convertible import to_json

from syncloud_platform.insider.config import Port


def test_port_mapping():
    expected = '{"protocol": "TCP", "external_port": "8080", "local_port": "80"}'
    actual = to_json(Port("80", "8080", "TCP"))
    assert expected == actual
