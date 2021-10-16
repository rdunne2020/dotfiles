#!/bin/bash

#Use a command line argument to set the name for the session
if [[ $# > 0 ]]; then
	session="$1"
else
	session="develop"
fi

is_running()
{
	#If there is already a session with this same name, return an error
	session_exists=$(tmux ls | grep -c $session)
	echo $sessoin_exists
	if [[ $session_exists -ne 0 ]]; then
		return 1
	else
		return 0
	fi
}

#Make sure there is no session by the name given already running
is_running

if [[ $? -ne 0 ]]; then
	return 1
else

	#Create a new tmux session, the new session won't be attached (-d) and we can run the rest of the script
	#Name the session with the first command line argument, or develop by default
	#Name the first window code, as that's where my programming takes place
	tmux new-session -d -s $session -n codeWindow 
	#Create a new detached window in the $session and name it testWindow
	tmux new-window -d -t $session -n testWindow
	#Create a third window
	tmux new-window -d -t $session -n otherWindow
	#Split the codeWindow window horizontally
	tmux split -h
	 
   	#Select the pane on the left
	#tmux select-pane -t 0
	
	#Split the left pane vertically
	#tmux split -v 

	#This is one way of executing commands for the different panes now
	#send-keys is like typing in the terminal, -t "codeWindow.1" says to execute the cmd in codeWindow pane 2
	#Whatever command you give it, finish with C-m which is the same as Enter
	#tmux send-keys -t 'codeWindow.0' eclipse_ssh C-m
	#tmux send-keys -t 'codeWindow.0' rhel_ssh C-m
	#tmux send-keys -t 'codeWindow.1' eclipse_ssh C-m

	#Switch to look at the testWindow window
	tmux select-window -t 'testWindow' 
	
	#Execute a command on the main window
	#tmux send-keys -t 'testWindow.0' "cd repo" C-m

	#This syntax splits the main window horizontall and runs the command after exec
	#The pane will only be alive for as long as the command you give it is running
	tmux split -v
	 
	#select the first pane
	tmux select-pane -t 0
	
	tmux split -h
	
	tmux select-pane -t 2 
	
	tmux split -h
	
	#Now attach the session
	tmux attach-session -t $session 
fi

