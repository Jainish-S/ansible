# Ansible Development Environment Setup

Automated setup for a development environment using Ansible.

## Quick Start

### Remote Installation

```bash
curl -s https://raw.githubusercontent.com/Jainish-S/ansible/main/install | bash
```

### Local Installation

```bash
# Install Ansible
sudo apt install ansible

# Clone and run
git clone https://github.com/Jainish-S/ansible.git
cd ansible
ansible-playbook local.yml --ask-become-pass
```

### Docker Setup

```bash
# Build and run in container
make build
make run

# Development mode
make dev
```

## What's Included

- **Core tools**: Git, Zsh, Tmux, Neovim
- **Development**: Python, Node.js, Docker
- **Media**: FFmpeg compilation from source
- **Productivity**: Various CLI tools and dotfiles
- **SSH**: Key generation and configuration

## Customization

Edit `local.yml` to enable/disable specific tasks using tags:

```bash
# Install only specific components
ansible-playbook local.yml --tags "git,zsh" --ask-become-pass
```

Available tags: `core`, `git`, `zsh`, `tmux`, `neovim`, `python`, `node`, `docker`, `ffmpeg`, `productivity`, `dotfiles`, `ssh`
