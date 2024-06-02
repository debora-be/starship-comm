{
  description = "A whole lotta flake to run your very own Ruby Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        inputs = with pkgs;
          [
            ruby_3_3
            rubyPackages_3_3.rails
            rubyPackages_3_3.sinatra
            bundler
            act
            msgpack
            libyaml
            zlib.dev
            libffi.dev
            direnv
          ]
          ++ pkgs.lib.optional pkgs.stdenv.isLinux [ pkgs.inotify-tools ]
          ++ pkgs.lib.optional pkgs.stdenv.isDarwin pkgs.terminal-notifier
          ++ pkgs.lib.optionals pkgs.stdenv.isDarwin (with pkgs.darwin.apple_sdk.frameworks; [ CoreFoundation CoreServices ]);
      in {
        packages = {
          default = pkgs.stdenv.mkDerivation {
            name = "starship-comm";
            src = ./.;
            buildInputs = inputs;
            buildPhase = ''
              bundle install --path vendor/bundle
            '';
            installPhase = ''
              mkdir -p $out
              cp -r . $out/
            '';
          };
        };

        devShells.default = pkgs.mkShell {
          name = "starship-comm";
          packages = inputs;
          shellHook = ''
            eval "$(direnv hook bash)"
            bundle install --path vendor/bundle
          '';
        };
      }
    );
}
