{ pkgs-unstable, ... }:
{
  # Ensure that the `Screenshots/` directory exists
  home.file."Screenshots/.keep".text = "";

  services.flameshot = {
    enable = true;
    package = pkgs-unstable.flameshot;
    settings = {
      General = {
        savePath = "/home/jurriaan/Screenshots";
        showStartupLaunchMessage = false;
        disabledTrayIcon = true;
        filenamePattern = "%F-%H%M%S";
        startupLaunch = true;
        saveAfterCopy = true;
      };
    };
  };
}

