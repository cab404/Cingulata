let
  pkgs = import ~/data/cab/nixpkgs {};
in
with pkgs; mkShell {

  buildInputs = [
    cmake boost xxd yad flint glib pugixml
    (python3.withPackages (a: [ a.networkx a.numpy ]))
  ];

}
