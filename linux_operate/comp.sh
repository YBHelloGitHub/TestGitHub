function _foo() 
{
    local cur prev opts

    COMPREPLY=()

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts="-h --help -f --file -o --output word"

    if [[ ${cur} == * ]]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
#	elif [[ ${cur} == "w" ]]; then
#		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
	fi
}

