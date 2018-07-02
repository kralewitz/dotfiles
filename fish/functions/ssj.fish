function ssj --description 'SSH to target over jumphost'
	function usage
        echo "
$_ SSH to target over jumphost
Usage: $_ <jumphost> <target>
"
    end
    set argc (count $argv)
    if [ $argc -lt 2 ]
        usage
        false
    else
        set -l jhost $argv[1]
        set -l target $argv[2]
        ssh -o ForwardAgent=yes -tt $jhost ssh $target
    end
end
