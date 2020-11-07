{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs;
stdenv.mkDerivation {
  name = "hellowasm";
  buildInputs = [ emscripten nodejs ];
}
