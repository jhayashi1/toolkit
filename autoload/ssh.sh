# Add ssh key
eval "$(ssh-agent -s)"
ssh-add --apple-load-keychain ~/.ssh/id_ed25519