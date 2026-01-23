autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

source ~/.aliases

for file in ~/autoload/*; do
  source "$file"
done

eval $(thefuck --alias)

function cd {
  builtin cd "$@"

  # Update iTerm2's tab title
  if [[ $TERM_PROGRAM == "iTerm.app" ]]; then
    echo -ne "\033]0;$(pwd | awk -F '/' '{print $NF}' | sed "s/$(whoami)/~/")\007"
  fi
}