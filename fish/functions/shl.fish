function shl -d "Syntax highlighting for files and streams."

	function usage
		echo "
$_ - syntax highlighting via python-pygments for files and stdin streams.
Usage:
    $_ [lexer] file1 [file2 [file3 [..]]
OR
    cat file | $_ [lexer]
Available lexers can be listed by running 'pygmentize -L lexers'."
	end

	# check if pygmentize is available and exit if not
	if not which pygmentize > /dev/null
		echo "pygmentize not found (pygments not installed?)"
		return 1
	end

	# get the list of available lexers from pygmentize
	set langs (pygmentize -L lexers | grep '^*' | string trim -c '*: ' | cut -d',' -f1)
	# get the count of command line arguments
	set argc (count $argv)

	# if stdin is not a pseudo-tty (no terminal attached), we got the input
	# via pipe redirection, so we read the incoming data and store it in a var
	if not isatty stdin
		read -z data

		# exit if we got empty data from stdin
		if [ -z $data ]
			echo "No data on stdin, exiting."
			usage
			return 1
		# no args are supplied, try to guess the language by using the '-g' option
		else if [ $argc -eq 0 ]
			echo $data | pygmentize -g -f terminal
		# use the first arg as the language if it's a valid choice
		else if [ $argc -ge 1 ]
			and contains $argv[1] $langs
				echo $data | pygmentize -l $argv[1] -f terminal
		end

	# no data from stdin, get the input from args
	else
		if [ $argc -eq 0 ]
			echo "No data on stdin or args supplied, exiting."
			usage
			return 1
		# if the first arg is a valid language name, parse all the files with the
		# supplied value as the lexer
		else if contains $argv[1] $langs
			and [ $argc -gt 1 ]
				for file in $argv[2..-1]
					pygmentize -l $argv[1] -f terminal $file
				end
		# guess the input lang for all supplied files
		else
			for file in $argv
				pygmentize -g -f terminal $file
			end
		end
	end
end
