# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains NixOS, nix-darwin (for macOS), and Home Manager configurations. The user maintains both a NixOS installation in a virtual machine (Parallels, UTM, or VMware) and uses nix-darwin to configure macOS.

## Project Structure

1. **Configuration Generation Functions**:
   - `nixos.nix`: Generates a NixOS configuration
   - `darwin.nix`: Generates a nix-darwin configuration for macOS
   - Both are used in `flake.nix`

2. **Modules**:
   - `modules/`: NixOS or nix-darwin level options
   - `home-modules/`: Home Manager options for both NixOS and macOS

3. **Machines**:
   - Contains specific machine configurations
   - Uses hardware configurations from `hardware/`

4. **Theme Support**:
   - Theme configuration is stored in `THEME.txt` file
   - Currently supports "dark" and "light" themes

## Common Commands

### Building and Switching Configurations

**For macOS**:
```bash
# Switch to the new configuration
make switch

# Switch with trace output for debugging
make switch-show-trace
```

**For NixOS**:
```bash
# Switch to the new configuration
make switch

# Switch with trace output for debugging
make switch-show-trace

# Test a configuration without switching
make test
```

### VM Management (for NixOS inside VMs)

```bash
# Initial bootstrap of a VM with NixOS ISO
export NIXADDR=<vm-ip-address>
make vm/bootstrap0

# After initial bootstrap, run these to finalize
make vm/bootstrap
make vm/secrets

# Copy configurations to VM
make vm/copy

# Apply configuration changes to VM
make vm/switch
```

### Nix Commands

```bash
# Update flake inputs
nix flake update

# Format nix files
nix fmt

# Enter development shell
nix develop
```

## Development Notes

1. The system configuration uses flakes and requires Nix with flakes enabled
2. The `THEME.txt` file controls the theme setting across various applications and should contain either "dark" or "light"
3. When making changes:
   - Edit relevant files in the repository
   - Run `make switch` to apply changes
   - For VMs, use `make vm/copy` followed by `make vm/switch`

4. The repository uses a modular approach with shared modules between NixOS and macOS configurations
5. Custom packages are defined in `flake.nix` under the `packages` attribute