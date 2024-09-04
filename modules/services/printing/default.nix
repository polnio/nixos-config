{ lib, mkUtils, ... }:
let
  utils = mkUtils lib;
in
{
  imports = utils.umport { path = ./printers; };

  os.services.printing.enable = true;
}
