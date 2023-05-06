{ lib, stdenv, fetchgit, autoreconfHook, pkg-config
, talloc, libosmocore, fftwFloat
, libusb1, limesuite, libbladeRF
}:


stdenv.mkDerivation rec {
  pname = "osmo-trx";
  version = "1.5.0";

  src = fetchgit {
    url = "https://gitea.osmocom.org/cellular-infrastructure/osmo-trx";
    rev = version;
    sha256 = "sha256-0S9lZlGwwNXJ3OKF6+A3a8iebyNosiRs/8pqW4CCCdg=";
  };

  nativeBuildInputs = [
    autoreconfHook
    pkg-config
  ];

  configureFlags = [
    "--with-bladerf"
    "--with-lms"
    "--with-ipc"
  ];

  preConfigure = ''
    export configureFlagsArray=("--with-systemdsystemunitdir=$out/lib/systemd")
  '';

  buildInputs = [
    libosmocore
    libusb1
    limesuite
    libbladeRF
    fftwFloat
  ];

  meta = with lib; {
    description = "SDR transceiver that implements the Layer 1 physical layer of a BTS";
    homepage = "https://osmocom.org/projects/osmotrx/wiki/OsmoTRX";
    license = licenses.agpl3Only;
  };
}
