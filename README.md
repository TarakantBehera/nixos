~/nixconf/
├── .git/
├── .gitignore
├── flake.nix
├── flake.lock
└── dotnix/
    ├── devices/
    │   └── pc/
    │       ├── default.nix              # system config (was configuration.nix)
    │       └── hardware-configuration.nix
    ├── dotfiles/                        # raw dotfiles (symlinked by Home Manager)
    │   └── (empty for now)
    └── home/
        └── default.nix                  # Home Manager entry point
        
