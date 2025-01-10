{ pkgs, ... }:
{
  hardware.printers.ensurePrinters = [
    {
      name = "HP_DeskJet_1110_series_USB_CN633281MY065R_HPLIP";
      description = "HP DeskJet 1110 Series";
      location = "Local Printer";
      deviceUri = "hp:/usb/DeskJet_1110_series?serial=CN633281MY065R";
      # model = "HP DeskJet 1110 Series";
      model = "HP/hp-deskjet_1110_series.ppd.gz";

    }
  ];
  services.printing.drivers = [ pkgs.hplip ];
}
