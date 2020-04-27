alias now='date +%Y-%m-%dT%H:%M:%S%z'

# Download a Youtube playlist as AAC
alias dlpl='youtube-dl -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" -f m4a/aac/mp3'

# Interactive directory search
alias zi='fasd -e cd -i'

# Random dad joke (https://github.com/Anupya/dadjoke-cli)
alias dadjoke='curl -s -H "Accept: text/plain" https://icanhazdadjoke.com/; echo'

# Open VSCodium with `code`
# alias code=codium
