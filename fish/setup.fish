#! /usr/bin/fish

set DFDIR (dirname (status filename))

echo $DFDIR

if not test -e $HOME/.config/fish/functions/fisher.fish

    echo "downloading fisher"
    curl -Lo $HOME/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

    echo "installing fisher plugins"
    fisher omf/theme-bobthefish get ansible-completion docker-completion
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
