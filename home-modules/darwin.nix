{ config, pkgs, lib, inputs, ... }:
let
  pkgs-unstable = import inputs.nixpkgs-unstable { system = pkgs.system; config.allowUnfree = true; };
in
{
  home.stateVersion = "22.05";

  home.packages = (with pkgs; [
    cachix
    fzf
    git
    git-lfs
    bat
    jq
    tree
    bottom
  ]) ++ (with pkgs-unstable; [ zellij ]);


  # Hide "last login" message on new terminal.
  home.file.".hushlogin".text = "";

  # programs.ssh doesn't work well for darwin.
 # Host localhost
  #    AddKeysToAgent yes
   #   IdentityFile "~/.orbstack/ssh/id_ed25519"
  home.file.".ssh/config".text = ''
    Host *
      AddKeysToAgent yes
      IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

    Include ~/.orbstack/ssh/config
  '';
}
