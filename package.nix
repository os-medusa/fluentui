{ lib,
  clangStdenv,
  cmake,
  fetchFromGitHub,
  ninja,
  qtbase,
  qttools,
  wrapQtAppsHook
}:

clangStdenv.mkDerivation rec {
  pname = "FluentUI";
  version = "1.7.7";

  src = fetchFromGitHub {
    owner = "zhuzichu520";
    repo = pname;
    rev = version;
    sha256 = "sha256-k7SUUYs5ZTjZ3bLIOwqrd6YzbFa+loviIWw6TnLim2Y=";
  };

  nativeBuildInputs = [
    cmake
    ninja
    wrapQtAppsHook
  ];

  buildInputs = [
    qtbase
    qttools
  ];

  patches = [ ./cmake.patch ];

  meta = with lib; {
    description = "A Fluent Design component library for Qt QML";
    license = licenses.mit;
    homepage = "https://github.com/zhuzichu520/FluentUI";
  };
}
