#!/usr/bin/env bash

# Install Homebrew if it's not already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Ansible
brew install ansible

# Clone the repository and run the playbook
git clone https://github.com/Jainish-S/ansible.git
cd ansible
ansible-playbook mac.yml --ask-become-pass