alias tmls="tmux list-sessions"

tatt () {
	tmux attach-session -t $1
}
