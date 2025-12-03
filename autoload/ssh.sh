# Add ssh key
eval "$(ssh-agent -s)" >/dev/null 2>&1
ssh-add --apple-load-keychain ~/.ssh/id_ed25519 2>&1 | boxes -d unicornthink 