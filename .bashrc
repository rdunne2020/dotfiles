# .bashrc
alias enw='emacs -nw'
alias vicky='vim -R'
alias lstr='exa -l --sort oldest'
alias la='exa --all'
alias ls='exa'
alias ll='exa -lhb --octal-permissions'

alias gba='git branch -a'
alias gbavv='git branch -avv'
alias gitgraph='git log --graph --decorate --color --all --oneline'
alias gbr='git branch -r'
alias gd='git diff'
alias gs='git status'
alias gbvv='git branch -vv'
alias gbu='git branch -u'

alias myTmux='source ~/.tmux.sh'

alias myMemUsage='ps aux --sort -pmem | grep -e "username" -e "%MEM"'

glog()
{
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit
}

lsg(){
    if (( $# ==1 )); then
	    ls . | grep $1
    else
		ls $1 | grep $2
    fi
}

# See if ripgrep is installed
which rg >& /dev/null
if [[ $? -eq 0 ]]; then
	deepgrep(){
	        if (( $# < 1 )); then
	                echo "Need a search string/directory"
	        elif (( $# == 1 )); then
	                rg -pSL --no-heading "${1}" 
	        elif [[ $# == 2 ]]; then
	                rg -pSL --no-heading "${1}" ${2}
	        elif (( $# == 3 )); then
					# the first argument should be your arugments surrounded by "" this way it can be run
	                rg -pSL --no-heading ${1} "${2}" ${3}
	        fi
	}
else
	deepgrep(){
	        if (( $# < 1 )); then
	                echo "Need a search string/directory"
	        elif (( $# == 1 )); then
	                find . -type f -print0 2>/dev/null | xargs -0 -P 4 grep --color -iIn "${1}" 2>/dev/null
	        elif [[ $# == 2 ]]; then
	                find ${2} -type f -print0 2>/dev/null | xargs -0 -P 4 grep --color -iIn "${1}" 2>/dev/null
	        elif (( $# == 3 )); then
	                find ${2} -type f -print0 2>/dev/null | xargs -0 -P 4 grep --color -${1} "${3}" 2>/dev/null
	        fi
	}
fi

rgrep(){
    if (( $# < 1 )); then
		echo "Need Search String"
    else
		grep -RHIEn ${1}
    fi
}

deepfind(){
    if (( $# < 1 )); then
	    echo "Need Search Dir/String"
    elif (( $# == 1 )); then
		find . \( -type d -o -type f -o -type l \) -iname "*${1}*" 2>/dev/null
    else
        find ${1} \( -type d -o -type f -o -type l \) -iname "*${2}*" 2>/dev/null
    fi
}

sortfile(){
    if (( $# == 1 )); then
		sort ${1} > ${1}.sorted
    fi
 }

lsCommit()
{
    if (( $# == 1 )); then
        git show $1 --name-only
    fi
}

formatCpp()
{
    if (( $# < 0 ));then
        echo "Error, give a file to format"
    elif (( $# == 1 )); then
        echo ${1}
        clang-format --style=file -i ${1}
    else
        args=( $@ )
        for file in "${args[@]}"
        do
            echo $file
            clang-format --style=file -i ${file}
        done
    fi
}

gbranch()
{
    if (( $# == 2 )); then
        git branch --track ${1} ${2} #the second arg is the upstream branch
        git checkout ${1}
    else
        echo "Need a branch name and upstream track"
    fi
}

memUsage()
{
	ps aux --sort=pmem | awk '{print "User: "$1" | PID: "$2 " | PROC: "substr($11,1,75)" | Cpu: "$3" | Mem: "$4}'
}

getUser()
{
	getent passwd ${1}
}

unwrapRpm()
{
    rpm2cpio ${1} | cpio -idmv
}

#another mem command echo 0 $(awk '/Rss/ {print "+", $2}' /proc/PID/smaps) | bc

#Fix the bad ls in git bash
export LS_COLORS=${LS_COLORS}:'ow=01;36;40:'