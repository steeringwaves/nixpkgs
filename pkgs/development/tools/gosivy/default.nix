{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gosivy";
  version = "0.2.0";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "nakabonne";
    repo = "gosivy";
    sha256 = "676660f00993cf9adc25a572c89d25484bf5dc56";
  };

  vendorSha256 = "676660f00993cf9adc25a572c89d25484bf5dc56";

  doCheck = false;

  meta = {
    description = "Another visualization tool for Go process metrics";
    homepage = "https://github.com/nakabonne/gosivy";
    license = lib.licenses.mit;
  };
}
