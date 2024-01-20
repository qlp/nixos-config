{ pkgs-unstable, ... }:
{
  users = {
    mutableUsers = false;
    users.jurriaan = {
      isNormalUser = true;
      home = "/home/jurriaan";
      extraGroups = [ "docker" "wheel" ];
      shell = pkgs-unstable.zsh;
      hashedPassword = "$6$PdTmjDW.DtXp.7Xr$AD9ybp6.Qsnl0b/0MVlnOo7zOiM0Lqh6kZYjh3dGF2AbqlGU0zPyislJvtjxRGVurXqE88hNAnBDW.cc7ySf30";
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB4rUA+CKIC1RK6NVxMaPkYIABhs5zL2Hwdxu4HSrpOH"
      ];
    };
  };
}
