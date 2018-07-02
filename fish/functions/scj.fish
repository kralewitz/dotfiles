function scj --description 'Copy files via scp over a jumphost'
	function usage
        echo "
$_ - Copy files via scp over a jumphost.
Usage: $_ <jump host> <src file> <dst file>"
    end

    set argc (count $argv)
    if [ $argc -lt 3 ]
        usage
        false
    else
        set -l jhost $argv[1]
        set -l src $argv[2]
        set -l dst $argv[3]
        scp -oProxyCommand="ssh -W %h:%p $jhost" $src $dst
    end
end
