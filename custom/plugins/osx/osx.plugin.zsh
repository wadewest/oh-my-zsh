# Only load the osx plugin if we are in OS X
if [[ -s /usr/bin/osascript ]]; then
	if [ -f $ZSH/plugins/osx/osx.plugin.zsh ]; then
    source $ZSH/plugins/osx/osx.plugin.zsh
  fi
fi