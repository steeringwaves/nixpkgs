{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "gosivy";
  version = "0.2.0";

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "nakabonne";
    repo = "gosivy";
    sha256 = "1jak1bg6k5iasscw68ra875k59k3iqhka2ykabsd427k1j3mypln";
  };

  vendorSha256 = "1pwsc488ldw039by8nqpni801zry7dnf0rx4hhd73xpv2w7s8n2r";

  doCheck = false;

  meta = {
    description = "Another visualization tool for Go process metrics";
    homepage = "https://github.com/nakabonne/gosivy";
    license = lib.licenses.mit;
  };
}
