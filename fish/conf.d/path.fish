set -xg PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin

if test -d $HOME/bin
	set -xg PATH $PATH $HOME/bin
end

if test -d /usr/local/go/bin
	set -xg PATH $PATH /usr/local/go/bin
	set -xg GOPATH /home/kwz
end
