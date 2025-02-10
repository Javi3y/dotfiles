function activatevenv(){
	VIRTUALENV_DIRS=("venv/" "env/" ".env" ".venv" "${PWD##*/}")
	for dir in $VIRTUALENV_DIRS; do
		if [[ -d "${dir}" ]]; then
			if [[ -e "./${dir}/bin/activate" ]]; then
				source ./${dir}/bin/activate
				echo "Virtual environment activatd automaticlly"
				break
			fi
		fi
	done

}
activatevenv

function cd(){
	builtin cd $@
	activatevenv
}
