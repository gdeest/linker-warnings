workspace(name = "linker_warnings")

http_archive(
  name = "io_tweag_rules_haskell",
  strip_prefix = "rules_haskell-0.5",
  urls = ["https://github.com/tweag/rules_haskell/archive/v0.5.tar.gz"]
)

load("@io_tweag_rules_haskell//haskell:repositories.bzl", "haskell_repositories")
haskell_repositories()

http_archive(
  name = "io_tweag_rules_nixpkgs",
  strip_prefix = "rules_nixpkgs-0.2",
  urls = ["https://github.com/tweag/rules_nixpkgs/archive/v0.2.tar.gz"],
)

load("@io_tweag_rules_nixpkgs//nixpkgs:nixpkgs.bzl",
  "nixpkgs_package",
  "nixpkgs_git_repository",
)

nixpkgs_git_repository(
  name = "nixpkgs",
  revision = "4026ea9c8afd09b60896b861a04cc5748fdcdfb4",
)

nixpkgs_package(
  name = "nix-env",
  nix_file_content = """
let pkgs = import <nixpkgs> {}; in
pkgs.buildEnv {
  name = "nix-env";
  paths = with pkgs; [
    lz4
    lz4.dev
    (haskell.packages.ghc822.ghcWithPackages (p: with p;
       [ base
         gtk3
       ]
     ))
  ];
}
  """,

  build_file_content = """
package(default_visibility = ["//visibility:public"])
filegroup(
  name = "bin",
  srcs = glob(["bin/*"]),
)

cc_library(
  name = "lz4",
  srcs = glob(["lib/liblz4.so"]),
  hdrs = glob(["include/lz4*.h"]),
  strip_include_prefix="include",
)
  """,
)

register_toolchains("//:nix-env")
