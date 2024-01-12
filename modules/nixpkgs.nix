{ ... }:
{
  # Lots of stuff that uses x86_64 that claims doesn't work, but actually works.
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
  };
}
