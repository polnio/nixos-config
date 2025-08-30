{
  lib,
  config,
  ...
}:
{
  xdg.dataFile."colors.json".text = builtins.toJSON (
    lib.attrsets.mapAttrs (name: value: "#${value}") config.stylix.base16Scheme
  );
}
