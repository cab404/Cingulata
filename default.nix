let
    cingulata = { pkgs, stdenv, fetchFromGitHub, cmake, git, boost, xxd, yad, flint, glib, pugixml }: 
        stdenv.mkDerivation {
            name = "cingulata";
            src = fetchFromGitHub {
                owner = "CEA-LIST";
                repo = "Cingulata";
                rev = "eb028240000ee4d4cbc7b1a1aacfaf62ca1f6e5f";
                sha256 = "18jcl7hqm2v26m1dfp8qqj2c3klj4iz3vnmcarjhjacpwgjhgxav";
                fetchSubmodules = true;
            };

            # patches = [ ./patches/0001-update-utils.py-to-networkx-2.4.py.diff ];

            nativeBuildInputs = [ cmake ];

            buildInputs = [
                boost xxd yad flint pugixml
                # (python3.withPackages (a: [ a.networkx a.numpy ]))
            ];

            cmakeFlags = [ "-DUSE_BFV=ON" ];
            buildFlags = [ "runtime" ];

            installPhase = ''
                mkdir -p $out/bin
                install -D apps/* $out/bin
            '';

        };
in
(import <nixpkgs> {}).callPackage cingulata {}