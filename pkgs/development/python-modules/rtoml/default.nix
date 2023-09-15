{ lib
, buildPythonPackage
, cargo
, fetchFromGitHub
, libiconv
, pytestCheckHook
, pythonOlder
, rustPlatform
, rustc
, setuptools-rust
}:

buildPythonPackage rec {
  pname = "rtoml";
  version = "0.9";

  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "samuelcolvin";
    repo = pname;
    rev = "refs/tags/v${version}";
    hash = "sha256-Vk/0SGtYhxZFIr/WuXadypZp07kPyzZp7N/1sFSI5dk=";
  };

  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit src;
    name = "${pname}-${version}";
    hash = "sha256-KcF3Z71S7ZNZicViqwpClfT736nYYbKcKWylOP+S3HI=";
  };

  nativeBuildInputs = with rustPlatform; [
    setuptools-rust
    rustc
    cargo
    rustPlatform.cargoSetupHook
  ];

  buildInputs = [
    libiconv
  ];

  pythonImportsCheck = [
    "rtoml"
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  preCheck = ''
    cd tests
  '';

  meta = with lib; {
    description = "Rust based TOML library for Python";
    homepage = "https://github.com/samuelcolvin/rtoml";
    license = licenses.mit;
    maintainers = with maintainers; [ evils ];
  };
}
