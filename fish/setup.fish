#! /usr/bin/fish

set DFDIR (dirname (status filename))

echo $DFDIR

ln -s $DFDIR/fishfile $HOME/.config/fish/fishfile

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

echo "copying functions and configuration"

mkdir -p $HOME/.config/fish
if not test -L $HOME/.config/fish/config.fish -a -e $DFDIR/config.fish
    rm -f $HOME/.config/fish/config.fish
    ln -s $DFDIR/config.fish $HOME/.config/fish/config.fish
end

mkdir -p $HOME/.config/fish/functions
for f in $DFDIR/functions/*
	rm -f $HOME/.config/fish/functions/(basename $f)
	ln -s $DFDIR/functions/(basename $f) $HOME/.config/fish/functions/(basename $f)
end

mkdir -p $HOME/.config/fish/conf.d
for f in $DFDIR/conf.d/*
	rm -f $HOME/.config/fish/conf.d/(basename $f)
	ln -s $DFDIR/conf.d/(basename $f) $HOME/.config/fish/conf.d/(basename $f)
end
