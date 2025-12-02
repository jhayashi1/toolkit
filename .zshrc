source ~/.aliases

for file in ~/autoload/*; do
  source "$file"
done

eval $(thefuck --alias)
