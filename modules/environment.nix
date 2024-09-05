{ inputs, pkgs, pkgs-unstable, pkgs-clion, lib, currentSystemName, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      git
      git-lfs
      file
      emacs29
      gnumake
      killall
      unzip
      rxvt_unicode
      xclip
      docker-client
      arc-theme
      nnn
      ripgrep
      trash-cli
      nil
      rsync
      (writeShellScriptBin "docker-stop-all" ''
        docker stop $(docker ps -q)
        docker system prune -f
      '')
      (writeShellScriptBin "docker-prune-all" ''
        docker-stop-all
        docker rmi -f $(docker images -a -q)
        docker volume prune -f
      '')
    ] ++ lib.optionals (currentSystemName == "vm-aarch64") [
      # This is needed for the vmware user tools clipboard to work.
      # You can test if you don't need this by deleting this and seeing
      # if the clipboard sill works.
      gtkmm3
    ] ++ ([
      pkgs-unstable.emacs
      pkgs-unstable.zed-editor
    ]);

    variables = {
      PS1 = "%m %d $ ";
      PROMPT = "%m %d $ ";
      RPROMPT = "";
      EDITOR = "hx";
      VISUAL = "hx";
      NNN_TRASH = "1"; # let nnn trash instead of rm

      # 2x ("retina"') scaling on Linux
      GDK_SCALE = "2";
      GDK_DPI_SCALE = "0.5";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      _JAVA_OPTIONS = "-Dsun.java2d.uiScale=2";
    };

    # required for zsh autocomplete
    pathsToLink = [ "/share/zsh" ];
  };
}
