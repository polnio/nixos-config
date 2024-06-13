{ pkgs, ... }: { os.environment.systemPackages = [ pkgs.slurp ]; }
