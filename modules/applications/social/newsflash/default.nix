{ pkgs, ... }:
{
  os.environment.systemPackages = [ pkgs.newsflash ];

  settings.windows.no-bar = [ "io.gitlab.news_flash.NewsFlash" ];
}
