{
  description = "Bibliography";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
    pre-commit-hooks,
  }: let
    supportedSystems = ["x86_64-linux"];
  in
    flake-utils.lib.eachSystem supportedSystems (system: let
      pkgs = import nixpkgs {inherit system;};
    in rec {
      checks = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;

          hooks = with pkgs; {
            check_docfiles = let
              python = pkgs.python3.withPackages (ps: with ps; [pyyaml]);
            in {
              enable = true;
              name = "check-docfiles";
              entry = "${python}/bin/python3 ./scripts/check_docfiles.py";
              files = "\.(yaml|bib)$";
              language = "system";
              pass_filenames = false;
            };
            make_bib = {
              enable = true;
              name = "make-bibliography";
              entry = "${pkgs.stdenv.shell} ./scripts/make-bib.sh";
              files = "\.(yaml|bib)$";
              language = "system";
              pass_filenames = false;
            };
            validate_bib = {
              enable = true;
              name = "validate-bibliograhy";
              entry = "${pkgs.biber}/bin/biber --tool -V ./bibliography.bib";
              files = "bibliography.bib";
              language = "system";
              pass_filenames = false;
            };
            alejandra.enable = true;
            commitizen.enable = true;
            editorconfig-checker.enable = true;
            prettier.enable = true;
            statix.enable = true;
            typos.enable = true;
          };
        };
      };

      devShells = {
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            just
            nodePackages.prettier
            pandoc
            pubs
            texlive.combined.scheme-full
            (python3.withPackages (ps: with ps; [pyyaml]))
          ];
          inherit (self.checks.${system}.pre-commit-check) shellHook;
        };
      };
    });
}
