package(default_visibility = ["//visibility:public"])

load(
  "@io_tweag_rules_haskell//haskell:haskell.bzl",
  "haskell_library",
  "haskell_toolchain",
)

haskell_toolchain(
  name = "nix-env",
  version = "8.2.2",
  tools = "@nix-env//:bin",
)

haskell_library(
  name = "dummy",
  src_strip_prefix = "src",
  srcs = ["src/Dummy.hs"],
  prebuilt_dependencies = [
    "base",
  ],
  deps = [":hs-dep"],
)

haskell_library(
  name = "hs-dep",
  src_strip_prefix = "src",
  srcs = ["src/Dep.hs"],
  prebuilt_dependencies = [
    "base",
    "gtk3",
  ],
  deps = ["@nix-env//:lz4"],
)
