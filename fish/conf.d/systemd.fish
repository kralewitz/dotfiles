function sdst
        sudo systemctl status $argv
end

function sdstart
    sudo systemctl start $argv
end

function sdstop
    sudo systemctl stop $argv
end

function sdrestart
    sudo systemctl restart $artv
end

function sdreload
    sudo systemctl daemon-reload
end

