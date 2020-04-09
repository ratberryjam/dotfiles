# cUrl API calls
function oscurl() {
	curl -A "com.xsilva.jamestest/0.0" -H "X-PAPPID:7c96637b-967e-4040-9ad3-aba423c920ab" -u "lightspeed:admin" -c "~/.oscookies" -b $HOME"/.oscookies" -c $HOME"/.oscookies" -skv "https://localhost:9630/api/$1" | xmllint --format -
}

# logout call
function osclose() {
	curl -A "com.xsilva.jamestest/0.0" -H "X-PAPPID:7c96637b-967e-4040-9ad3-aba423c920ab" -H "Accept-Encoding:gzip" -u "lightspeed:admin" -c "{$HOME}/.oscookies" -b "{$HOME}/.oscookies" -X POST -skv "https://localhost:9630/api/sessions/current/logout/"
}
