Opinionated Branch Overview

This branch serves as the central consolidation point for multiple dotfiles expansions and feature branches, including:

- powershell-dotfiles-expansion  
- windows-dotfiles-expansion  
- vscode-dotfiles-expansion (planned)  
- and others...

The goal is to gather incremental changes and configurations from specialized branches into one opinionated monorepo structure.  
This approach helps maintain modularity while allowing a single source of truth for upcoming features and environment customizations.

Branch Workflow

- Feature branches (e.g. powershell-dotfiles-expansion) are developed independently.  
- Pull requests into opinionated branch are reviewed and merged after validation.  
- The opinionated branch acts as upstream for overall integration before merging to master.  
