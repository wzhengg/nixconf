inputs@{ config, pkgs, ... }:

{
  home.username = "bill";
  home.homeDirectory = "/home/bill";

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

    brightnessctl

    curl
    fd
    gnumake
    gnutar
    ripgrep
    tree-sitter

    man-pages
    man-pages-posix

    gcc
    gdb

    go
    gopls
    gotools

    lua
    lua-language-server

    nixd
    nixfmt
  ];

  fonts.fontconfig.enable = true;

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
    config = {
      warn_timeout = 0;
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "William Zheng";
        email = "williamzheng2001@gmail.com";
      };
      core = {
        editor = "nvim";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    defaultEditor = true;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {

        font = "Berkeley Mono:size=16,JetBrainsMono Nerd Font:size=16";
        pad = "4x4 center-when-maximized-and-fullscreen";
      };

      scrollback = {
        lines = 10000;
        indicator-position = "none";
      };

      cursor = {
        style = "block";
        blink = "no";
      };

      mouse = {
        hide-when-typing = "yes";
      };

      colors = {
        foreground = "dcd7ba";
        background = "1f1f28";

        selection-foreground = "c8c093";
        selection-background = "2d4f67";

        regular0 = "090618";
        regular1 = "c34043";
        regular2 = "76946a";
        regular3 = "c0a36e";
        regular4 = "7e9cd8";
        regular5 = "957fb8";
        regular6 = "6a9589";
        regular7 = "c8c093";

        bright0 = "727169";
        bright1 = "e82424";
        bright2 = "98bb6c";
        bright3 = "e6c384";
        bright4 = "7fb4ca";
        bright5 = "938aa9";
        bright6 = "7aa89f";
        bright7 = "dcd7ba";

        "16" = "ffa066";
        "17" = "ff5d62";
      };
    };
  };

  programs.firefox = {
    enable = true;
    policies = { };
    profiles = {
      default = {
        id = 0;
        settings = {
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
          "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
          "browser.newtabpage.activity-stream.discoverystream.enabled" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.showWeather" = false;
          "browser.tabs.groups.smart.userEnabled" = false;
          "browser.urlbar.suggest.engines" = false;
          "browser.urlbar.suggest.quicksuggest.all" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.urlbar.suggest.trending" = false;
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.usage.uploadEnabled" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "privacy.globalprivacycontrol.enabled" = true;
          "sidebar.main.tools" = "history,bookmarks";
          "sidebar.verticalTabs" = true;
          "sidebar.visibility" = "hide-sidebar";
          "signon.rememberSignons" = false;
        };
      };
    };
  };

  services.wlsunset = {
    enable = true;
    latitude = 40;
    longitude = -74;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.file = { };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/bill/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.
}
