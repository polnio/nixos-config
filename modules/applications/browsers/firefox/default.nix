{ pkgs, inputs, ... }: {
  inputs = {
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
    catppuccin-firefox-gnome = {
      url =
        "https://github.com/GradienceTeam/Plugins/raw/f51cfd8937846dcccefaf347ba21429efd2fcbad/firefox_gnome_theme.py";
      flake = false;
    };
  };
  os.environment.systemPackages = [ pkgs.firefox ];
  hm.programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      isDefault = true;

      settings = {
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enabled" = true;
        "browser.uiCustomization.state" = ''
          {"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","ublock0_raymondhill_net-browser-action","sponsorblocker_ajay_app-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","addon_darkreader_org-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","customizableui-special-spring1","urlbar-container","customizableui-special-spring2","downloads-button","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button","alltabs-button"],"PersonalToolbar":["import-button","personal-bookmarks"]},"seen":["save-to-pocket-button","developer-button","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","addon_darkreader_org-browser-action","sponsorblocker_ajay_app-browser-action","ublock0_raymondhill_net-browser-action","_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action","_7a7a4a92-a2a0-41d1-9fd7-1e92480d612d_-browser-action"],"dirtyAreaCache":["nav-bar","PersonalToolbar","toolbar-menubar","TabsToolbar","unified-extensions-area"],"currentVersion":20,"newElementCount":2}'';
        "browser.startup.homepage" = "https://web.tabliss.io";
        "gnomeTheme.systemIcons" = true;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
        @import "firefox-gnome-theme/theme/colors/dark.css";
      '';
      userContent = ''
        @import "firefox-gnome-theme/userContent.css";
      '';

      search.force = true;
      search.engines = {
        "Nix Packages Versions" = {
          urls = [{
            template = "https://lazamar.co.uk/nix-versions/";
            params = [
              {
                name = "channel";
                value = "nixos-unstable";
              }
              {
                name = "package";
                value = "{searchTerms}";
              }
            ];
          }];
          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@nv" ];
        };
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];
          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        "Nix Options" = {
          urls = [{
            template = "https://search.nixos.org/options";
            params = [
              {
                name = "channel";
                value = "unstable";
              }
              {
                name = "type";
                value = "options";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];
          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@no" ];
        };
        "Home Manager Options" = {
          urls = [{
            template = "https://home-manager-options.extranix.com/";
            params = [
              {
                name = "release";
                value = "master";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];
          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@hp" ];
        };
        "Youtube" = {
          urls = [{
            template = "https://www.youtube.com/results";
            params = [{
              name = "search_query";
              value = "{searchTerms}";
            }];
          }];
          definedAliases = [ "@yt" "@youtube" ];
        };
      };
      bookmarks = [
        {
          name = "Home-Manager Options";
          url = "https://nix-community.github.io/home-manager/options.xhtml";
        }
        {
          name = "Home-Manager Search Options";
          url = "https://home-manager-options.extranix.com/?release=master";
        }
        {
          name = "NixOS Search Packages";
          url = "https://search.nixos.org/packages?channel=unstable";
        }
        {
          name = "NixOS Search Options";
          url = "https://search.nixos.org/options?channel=unstable";
        }
        {
          name = "NixOS Tutorial";
          url =
            "https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE";
        }
        {
          name = "Whatsapp";
          url = "https://web.whatsapp.com/";
        }
        {
          name = "GMail";
          url = "https://mail.google.com";
        }
        {
          name = "GitHub";
          url = "https://github.com";
        }
        {
          name = "YouTube";
          url = "https://youtube.com";
        }
        {
          name = "Twitch";
          url = "https://twitch.tv";
        }
        {
          name = "Tekiens.net";
          url = "https://tekiens.net";
        }
        {
          name = "Gitlab Tekiens.net";
          url = "https://gitlab.com/ptlc8/tekiens-net";
        }
        {
          name = "Cy Delta";
          url = "https://cy.deltahmed.fr";
        }
        {
          name = "Base16 Scheme";
          url = "https://github.com/chriskempson/base16/blob/main/styling.md";
        }
      ];
      extensions = with pkgs.nur.repos.rycee.firefox-addons;
        [
          bitwarden
          ublock-origin
          sponsorblock
          darkreader
          vimium
          stylus
          i-dont-care-about-cookies
        ] ++ [
          (buildFirefoxXpiAddon rec {
            pname = "twitch-no-sub";
            version = "0.7.1";
            addonId = "twitchnosub@besuper.com";
            url =
              "https://github.com/besuper/TwitchNoSub/releases/download/${version}/TwitchNoSub-firefox.${version}.xpi";
            sha256 = "0gr8yrw6pcbj80mi6kxmzlww3nf8wwyra2bmcpnbzs3js9crmwk7";
            meta = with pkgs.lib; {
              homepage = "https://github.com/besuper/TwitchNoSub";
              description = "Show sub only VOD on Twitch";
              licence = licences.apache20;
              permissions = [
                "activeTab"
                "tabs"
                "webNavigation"
                "webRequest"
                "webRequestBlocking"
                "https://*.twitch.tv/*"
                "https://static.twitchcdn.net/assets/*"
              ];
              platforms = platforms.all;
            };
          })
        ];
    };
  };

  hm.home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme" = {
    source = inputs.firefox-gnome-theme;
    recursive = true;
  };

  hm.home.file.".mozilla/firefox/default/chrome/firefox-gnome-theme/customChrome.css".source =
    ./customChrome.css;

  hm.wayland.windowManager.hyprland.settings.windowrule =
    [ "plugin:hyprbars:nobar,firefox" ];
}
