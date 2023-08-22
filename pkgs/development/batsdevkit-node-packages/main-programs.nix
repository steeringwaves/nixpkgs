# Use this file to add `meta.mainProgram` to packages in `batsDevkitNodePackages`, that don't provide an
# executable that matches that packages name, so that they'll work with `nix run`.
{
  # Packages that provide multiple executables where one is clearly the `mainProgram`.
  "@steeringwaves/gobs" = "gobs";
}
