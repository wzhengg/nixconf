inputs@{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "colemak";
  };

  console.useXkbConfig = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.bill = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.fish;
    packages = [ ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    brightnessctl

    curl
    gnumake
    ripgrep

    man-pages
    man-pages-posix

    gcc
    gdb

    go
    gopls

    lua
    lua-language-server

    nixd
    nixfmt
  ];

  programs.firefox.enable = true;
  programs.fish.enable = true;
  programs.foot.enable = true;
  programs.git.enable = true;
  programs.river-classic.enable = true;
  programs.tmux.enable = true;
  programs.vim.enable = true;
  programs.waybar.enable = true;

  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly.packages.${pkgs.system}.default;
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  services.logind = {
    settings.Login = {
      HandleLidSwitch = "suspend";
      HandlePowerKey = "suspend";
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?
}
