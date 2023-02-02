{ pkgs ? import <nixpkgs> {}}:

let

  pythonVer = pkgs.python39;

  turtle = { python, fetchPypi }: python.pkgs.buildPythonPackage rec {
    pname = "turtle";
    version = "0.0.2";
    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-iS9dG/zKXzUeX+R+rX+3/ZjSdg6/pjtxa13x2WHF4Bc=";
    };
  };

  pythonEnv = pythonVer.withPackages ( ppkgs:
    with ppkgs; [
      opencv4
      numpy
      tqdm
      pillow
      readchar
      turtle
      tkinter
    ]
  );

in pkgs.mkShell {
  buildInputs = [ pythonEnv ];
}
