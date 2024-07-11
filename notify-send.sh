#!/bin/sh

# notify-send wrapper for terminal-notifier
# To be used with vagrant-notify

title=Homestead

case "$#" in
    0)
        echo "No input given" >> /dev/stderr
        exit 1
        ;;
    1)
        message="$1"
        ;;
    2)
        title="$1"
        message="$2"
        ;;
    *)
        echo "Too many arguments" >> /dev/stderr
        exit 1
esac


if [[ -z $message ]]; then
  exit 1
fi

/usr/local/bin/terminal-notifier -message "$message" -title "$title" -activate com.googlecode.iterm2
