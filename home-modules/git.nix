{ isDarwin, ... }:
{
  programs.git =
    let
      sshSigningKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB4rUA+CKIC1RK6NVxMaPkYIABhs5zL2Hwdxu4HSrpOH";
    in
    {
      enable = true;
      delta.enable = true;
      userName = "jurriaan";
      userEmail = "jurriaan@pruijs.nl";
      lfs.enable = true;
      extraConfig = {
        color.ui = true;
        github.user = "qlp";
        gpg.format = "ssh";
        init.defaultBranch = "main";

        # Fix go private dependency fetching by using SSH instead of HTTPS
        "url \"ssh://git@github.com/\"".insteadOf = "https://github.com/";
        commit.gpgsign = true;
      } // (if isDarwin then {
        user.signingkey = sshSigningKey;
        gpg."ssh".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        gpg.format = "ssh";
      } else {
        user.signingkey = sshSigningKey;
        commit.gpgsign = true;
        signing = {
          signByDefault = true;
          key = sshSigningKey;
        };
      });
    };
}
