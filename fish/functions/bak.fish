function bak
	# cp params - don't follow links, copy recursively, don't overwrite files
    for oldpath in $argv
        set -l newpath $oldpath'_'(date --iso-8601=seconds | cut -d'+' -f1)
        cp -an $oldpath $newpath
    end
end