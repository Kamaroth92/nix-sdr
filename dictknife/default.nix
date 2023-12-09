{ lib
, stdenv
, brotlicffi
, buildPythonPackage
, chardet
, fetchPypi
, fetchpatch
, pythonOlder
}:

buildPythonPackage rec {
  pname = "dictknife";
  version = "0.14.0";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-FksbkGNzYrLBxFz8zZ6xfuc4MlF8l5dr83Y6PrRkZjQ=";
  };

  pythonImportsCheck = [
    "dictknife"
  ];

  meta = with lib; {
    description = "p swiss army knife for handling dict";
    homepage = "http://docs.python-requests.org/";
    changelog = "https://github.com/psf/requests/blob/v${version}/HISTORY.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}