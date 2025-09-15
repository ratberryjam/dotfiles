alias now='date +%Y-%m-%dT%H:%M:%S%z'

# Download a Youtube playlist as AAC
alias dlpl='youtube-dl -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" -f m4a/aac/mp3'

# Random dad joke (https://github.com/Anupya/dadjoke-cli)
alias dadjoke='curl -s -H "Accept: text/plain" https://icanhazdadjoke.com/; echo'

# Laravel
alias sail='bash vendor/bin/sail'
alias sup='sail up -d'
alias sud='sail down && sail up -d'
# alias sart='sail artisan'
alias art=artisan

# git
alias gs='git status'
alias gf='git fetch'
alias gc='git checkout'
alias gb='git checkout -b'
alias gpl='git pull'
alias gpu='git push'

# PHPStorm
alias pstorm='phpstorm'

# eza replacing ls
alias ls='eza -l --git --icons=auto --color=auto --time-style=relative'

alias dc='docker compose'
alias dcd='docker compose down --remove-orphans'
alias dcu='docker compose up -d'
alias dcdu='docker compose down --remove-orphans && docker compose up -d'
alias dcs='docker compose stop'
alias dce='docker compose exec'

alias air='~/go/bin/air'

# Copilot
if (( $+commands[gh] )); then
  # GitHub Copilot
  alias ghcp='gh copilot'

  # Explain a command
  alias cpe='ghcp explain'

  # Suggest a command
  alias cps='ghcp suggest'
fi
