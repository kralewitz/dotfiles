if which vim > /dev/null ^&1
    function nano
        vim $argv
    end
end
