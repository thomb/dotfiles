docker_logs () {
	docker logs $1 2>&1| $@
}

dk_list () {
	docker ps -a;
}

dk_logs () {
	docker logs $1 2>&1
}
