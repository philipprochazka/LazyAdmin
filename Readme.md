#LazyAdmin – Poweshell-dotfiles-expansion Branch 📦
___________________________________

## Overview 🕶
This branch serves as the main consolidation point for all upcoming feature expansions,  
including Windows-dotfiles-expansion, PowerShell, VSCode, and others.

## Purpose 🎈
The opinionated branch represents a centralized monolith where different projects  
and extension modules are merged for easier management and deployment.

## Structure 👀
- *powershell-dotfiles-expansion*  
  Contains PowerShell modules and configurations.
- *windows-dotfiles-expansion*  
  Windows-specific environment extensions.
- *vscode-dotfiles-expansion*  
  Configuration and extensions for Visual Studio Code.

## Workflow 🎶
- Feature branches are created from opinionated for specific areas.
- After completing changes, merges are done back into opinionated.
- The upstream repository uses this branch as the main source.

## How to Use ⁉
1. Clone the repository and switch to the `opinionated` branch  
   bash
   git clone https://github.com/philipprochazka/LazyAdmin.git
   git checkout opinionated
   ```
2. Create feature branches from opinionated for new development.
3. When finished, create pull requests back to opinionated.
Contribution Guidelines
- Maintain a clear folder and module structure.
- Write commits using the format:
  
  [Type]: Short description of the change (max 50 chars)
  
  Detailed explanation of what and why.
  

## Highlights 🎉

- Modular layout supporting easy expansion and maintenance.

Desired Structure Overview


/Modules      – PowerShell modules
/Config       – User/environment-specific configs
/GitTools     – PowerShell-driven Git helpers
/Docs         – Script notes or helper descriptions


Notes

This branch is under active consolidation. Expect frequent changes.  
The main branch (master) remains untouched. Opinionated serves as the upstream base.

---

*Co-authored-by: Philip Procházka <ph.prochazka@gmail.com>
