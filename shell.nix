{
  sources ? import ./npins,
  pkgs ? import sources.nixpkgs {},
}:

pkgs.mkShell {
  packages = with pkgs; [
    npins

    typst
    tinymist
    typstyle
  ];
}
