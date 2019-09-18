# Defined in - @ line 1
function sd --description 'alias sd=sudo systemctl'
	sudo systemctl $argv;
end
# Defined in - @ line 1
function sddrl --description 'alias sddrl=sudo systemctl daemon-reload'
	sudo systemctl daemon-reload $argv;
end
# Defined in - @ line 1
function sdst --description 'alias sdst=sudo systemctl status'
	sudo systemctl status $argv;
end
