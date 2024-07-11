# Go to server folder
function cdls() { -d
	cd /Library/Application\ Support/LightSpeed\ Server
}

# Permissions
function chmodls() {
	sudo chmod 700 /Library/Application\ Support/LightSpeed\ Server/databases/
}

function chownls() {
	sudo chown -R _lightspeedserver:admin /Library/Application\ Support/LightSpeed\ Server/
}

function lsp() { #chown and chmod
	sudo chown -R _lightspeedserver:admin /Library/Application\ Support/LightSpeed\ Server/ && sudo chmod -R 700 /Library/Application\ Support/LightSpeed\ Server/databases/
}

# Start/stop things
function lls() { #Load everthing
	sudo launchctl load /Library/LaunchDaemons/com.xsilva.*
}

function ulls() { #Unload everthing
	sudo launchctl unload /Library/LaunchDaemons/com.xsilva.*
}

function rlls() { #Reload everthing
	sudo launchctl unload /Library/LaunchDaemons/com.xsilva.* && sudo launchctl load /Library/LaunchDaemons/com.xsilva.*
}

function rllsserver() { #Reload server
	sudo launchctl unload /Library/LaunchDaemons/com.xsilva.lightspeed.server* && sudo launchctl load /Library/LaunchDaemons/com.xsilva.lightspeed.server*
}

function llsnoserver() { #Load everthing except server
	sudo launchctl load /Library/LaunchDaemons/com.xsilva.lightspeed.postgres.plist
	sudo launchctl load /Library/LaunchDaemons/com.xsilva.lightspeed.pgAuth.plist
	sudo launchctl load /Library/LaunchDaemons/com.xsilva.lightspeed.daemon.plist
	sudo launchctl load /Library/LaunchDaemons/com.xsilva.lightspeed.newsyslog.plist
	sudo launchctl load /Library/LaunchDaemons/com.xsilva.LightSpeedServerManagerHelper.plist
}

# Show logs
function logd() { #Daemon logs
	tail -F -n 20 /Library/Application\ Support/LightSpeed\ Server/logs/daemon.log
}

function logp() { #Postgres logs
	tail -F -n 20 /Library/Application\ Support/LightSpeed\ Server/logs/postgres.log
}

function logs() { #Server logs
	tail -F -n 20 /Library/Application\ Support/LightSpeed\ Server/logs/server1.log
}

function logsp() { #Server + Postgres logs
	tail -F -n 20 /Library/Application\ Support/LightSpeed\ Server/logs/server1.log /Library/Application\ Support/LightSpeed\ Server/logs/postgres.log
}

# See server-related processes
function psls() {
	ps -c -u _lightspeedserver; ps -c -u root | grep --colour=never pgAuthServer
}

# Uninstall
function rmls() {
	sudo /usr/bin/python ~/Dropbox/bin/uninstall_lightspeed
}

# Postgres
function crackpg() {
  PGAUTHPATH="${HOME}/Documents/OnSite/Postgres/pgAuthServer-INTERNAL-x64"
  sudo launchctl unload /Library/LaunchDaemons/com.xsilva.lightspeed.pgAuth.plist
  sudo cp -f $PGAUTHPATH '/Library/Application Support/LightSpeed Server/postgres/bin/pgAuthServer'
  sudo launchctl load /Library/LaunchDaemons/com.xsilva.lightspeed.pgAuth.plist
}

# Open OnSite db in pgcli
function lspgcli() {
	server="server"$1
    pgcli -h '/Library/Application Support/LightSpeed Server/' "$server" _lightspeedserver
}
