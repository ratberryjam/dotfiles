alias hs='herd start'
alias hst='herd stop'
alias hr='herd restart'

function herd_xdebug_context () {
    local version_arg="$1"

    typeset -g HERD_XDEBUG_VERSION="${version_arg:-$(herd php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;")}"
    typeset -g HERD_XDEBUG_INI="$HOME/Library/Application Support/Herd/config/php/${HERD_XDEBUG_VERSION}/php.ini"
    if [ ! -f "$HERD_XDEBUG_INI" ]; then
        echo "No Herd config for PHP version ${HERD_XDEBUG_VERSION}."
        return 1
    fi

    typeset -g HERD_XDEBUG_LINE="zend_extension=/Applications/Herd.app/Contents/Resources/xdebug/xdebug-${HERD_XDEBUG_VERSION}-arm64.so"
    typeset -g HERD_XDEBUG_REGEX="^[;[:space:]]*zend_extension=.*/xdebug-${HERD_XDEBUG_VERSION}-arm64\\.so"

    echo "HERD_XDEBUG_VERSION: ${HERD_XDEBUG_VERSION}"
    echo "HERD_XDEBUG_INI: ${HERD_XDEBUG_INI}"
    echo "HERD_XDEBUG_LINE: ${HERD_XDEBUG_LINE}"
    echo "HERD_XDEBUG_REGEX: ${HERD_XDEBUG_REGEX}"
}

function herd_enable_xdebug () {
    herd_xdebug_context "$1" || exit 1

    # Make sure the xdebug extension line is present and uncommented in the php.ini file
    if grep -Eq "$HERD_XDEBUG_REGEX" "$HERD_XDEBUG_INI"; then
        sed -i '' -E "s|$HERD_XDEBUG_REGEX|$HERD_XDEBUG_LINE|" "$HERD_XDEBUG_INI"
    else
        echo "$HERD_XDEBUG_LINE" >> "$HERD_XDEBUG_INI"
    fi

    # Set xdebug.mode=debug,develop in the php.ini file
    if grep -Eq "^[;[:space:]]*xdebug.mode=" "$HERD_XDEBUG_INI"; then
        sed -i '' -E "s|^[;[:space:]]*xdebug.mode=[^[:space:]]+|xdebug.mode=debug,develop|" "$HERD_XDEBUG_INI"
    else
        echo "xdebug.mode=debug,develop" >> "$HERD_XDEBUG_INI"
    fi

    herd restart
}

function herd_disable_xdebug () {
    herd_xdebug_context "$1" || exit 1

    # Set xdebug.mode=off in the php.ini file
    if grep -Eq "^[;[:space:]]*xdebug.mode=" "$HERD_XDEBUG_INI"; then
        sed -i '' -E "s|^[;[:space:]]*xdebug.mode=[^[:space:]]+|xdebug.mode=off|" "$HERD_XDEBUG_INI"
    else
        echo "xdebug.mode=off" >> "$HERD_XDEBUG_INI"
    fi

    herd restart
}
