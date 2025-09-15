function error() {
    echo -e "\e[31m$1\e[0m\n"
    exit 1
}

app=($(
    cat $ZSH_STUFF/plugins/forge_apps.txt | gum filter
))

echo "${app[1]}\n"
echo "$app\n"

env=$(gum choose {staging,production})

case $env in
production)
    subdomain=${app[1]}
    server=${app[2]}
    ;;
staging)
    subdomain=${app[1]}-staging
    server=${app[3]}
    ;;
esac

site=$subdomain.lightspeedservices.io

gum confirm "Deploy $site on $server?" # || error "Cancelled"

forge server:switch $server && forge deploy $site
