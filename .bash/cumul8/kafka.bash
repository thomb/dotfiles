kpeek () {
	pushd ~/go/src/cumul8.com/ozone/tools/kpeek;
	./kpeek $1 -y -c 1 -o last -t $2
	popd
	# NOTE on prod add `-k kafka-1:9092`
}
