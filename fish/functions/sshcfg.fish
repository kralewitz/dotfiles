function sshcfg
	bak ~/.ssh/config
    cat ~/.ssh/conf.d/config  > ~/.ssh/config
    for f in ~/.ssh/conf.d/*.conf
        echo "" >> ~/.ssh/config
        cat $f >> ~/.ssh/config
    end
end
