function ga
	git add $argv
end

function gc
	git commit -m $argv
end

function gs
	git status $argv
end

function gp
	git push $argv
end

function gpo
	git push origin $argv
end

function gitlol
	git log --graph --decorate --pretty=oneline --abbrev-commit $argv
end
