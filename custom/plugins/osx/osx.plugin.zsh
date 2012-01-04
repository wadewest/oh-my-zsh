# Only load the osx plugin if we are in OS X
if [[ -s /usr/bin/osascript ]]; then
	if [ -f $ZSH/plugins/osx/osx.plugin.zsh ]; then
    source $ZSH/plugins/osx/osx.plugin.zsh
  fi

	function battery_percent() {
		ioreg -l | egrep -i "(max|current)capacity" | sed "s/\|//g" | sed "s/ //g" | cut -d '=' -f 2 | tr '\n' ' ' | awk '{printf("%.0f", $2/$1 * 100)}' | sed 's/\%//'
	}
	
	function battery_full() {
		ioreg -l | grep FullyCharged | sed "s/\|//g" | sed "s/ //g" | cut -d '=' -f 2
	}
	
	function battery_charging() {
		ioreg -l | grep IsCharging | sed "s/\|//g" | sed "s/ //g" | cut -d '=' -f 2
	}

	function battery_extern_power() {
		ioreg -l | grep ExternalConnected | sed "s/\|//g" | sed "s/ //g" | cut -d '=' -f 2
	}
	
	function battery_prompt() {
		if [[ $(battery_extern_power) == Yes && $(battery_full) == Yes ]]; then
			echo "FULL"
		fi
	}

fi