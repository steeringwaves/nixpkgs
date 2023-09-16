{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gosivy";
  version = "0.2.0";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "nakabonne";
    repo = "gosivy";
    sha256 = "1vn13zbxscpjgshbrn1whmz394xj98liih803y1dwwljrxngfn8l";
  };

  vendorSha256 = "sha256-NYefjtZrdQXtrJCjyW4Y5J3mCgUkLk5aa/UzUgZ1zQQ=";

  doCheck = false;

  meta = {
    description = "Another visualization tool for Go process metrics";
    homepage = "https://github.com/nakabonne/gosivy";
    license = lib.licenses.mit;
  };
}
