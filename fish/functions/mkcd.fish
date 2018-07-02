function mkcd --description='Create a new directory and change CWD to it.'
	command mkdir $argv
    if test $status = 0
        switch $argv[(count $argv)]
        case '-*'

        case '*'
            cd $argv[(count $argv)]
            return
        end
    end
end
