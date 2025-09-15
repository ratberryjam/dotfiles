function iterm_tmux_attempt_attach() {
	sessions=$(tmux ls)

	if [[ -n $sessions ]]; then
		echo "Attaching to existing session…"
		tmux -CC attach
	else
		echo "Starting new session…"
		tmux -CC
	fi
}

# https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
function colortest() {
	T='gYw' # The test text
	echo -e "\n                 40m     41m     42m     43m     44m     45m     46m     47m"

	for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
		'1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
		'  36m' '1;36m' '  37m' '1;37m'; do
		FG=${FGs// /}
		echo -en " $FGs \033[$FG  $T  "
		for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
			echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m"
		done
		echo
	done
	echo
}

function codeworkspace() {
	usage() {
		echo "Usage: codeworkspace [-o] directory"
		echo "  -h  Show this help message"
		echo "  -o  Open the workspace in VSCode"
		echo "  directory  The directory to create the workspace for"
	}

	# Positional arguments
	local pos_args=""
	# Flag arguments
	local open=0

	while (("$#")); do
		case "$1" in
		-h | --help | help)
			usage
			return 0
			;;
		-o | --open)
			open=1
			shift
			;;
		-* | --*=) # Unsupported flags
			printf "Error: Unsupported flag %s\n" "$1" >&2
			usage >&2
			return 1
			;;
		*) # Preserve positional arguments
			pos_args="$pos_args $1"
			shift
			;;
		esac
	done

	eval set -- "$pos_args" # Reset argv to just the positional args

	if [ $# -ne 1 ]; then
		echo "Error: You must pass exactly one directory"
		usage >&2
		return 1
	fi

	workspace_file_path="$HOME"/.vscode-workspaces/"$(basename "$dir")".code-workspace

	echo "{\"folders\":[{\"path\":\"$dir\"}],\"settings\":{}}" >"$workspace_file_path"

	if [[ $open -eq 1 ]]; then
		open -a "Visual Studio Code" "$workspace_file_path"
	fi
}
