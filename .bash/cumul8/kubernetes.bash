
kp () { 
	kubectl --context=gke_cirrus-bid_us-central1-a_forestry-prod $@ 
}
export -f kp

kpod () {
	kp exec -ti $@ bash
}

alias kfd='kubectl --kubeconfig ~/.kube/forestry-dev.config'

klist () {
	kp get pods -n forestry-prod
}

podlist () {
	kp get pods -n forestry-prod | grep $1
}

devpodlist () {
	kfd get pods -n forestry-dev
}

tpslist () {
	kp get pods -n tps -L tps-pipeline-name --sort-by=.metadata.labels.tps-pipeline-name
}

kafsync () {
	pushd /local/cumul8-platforms/forestry/dev/forestry-dev;
	kfd delete -f ./configs/kafkasyncer-config.yaml;
	kfd delete -f ./deployments/kafkasyncer-deployment.yaml;
	kfd apply -f ./configs/kafkasyncer-config.yaml;
	kfd apply -f ./deployments/kafkasyncer-deployment.yaml;
	popd
}

klogs () {
	kp logs -f $1 --namespace=forestry-prod
}

devlogs () {
	kfd logs -f $1 --namespace=forestry-dev
}

tpsdevlogs () {
	kfd logs -f $1 --namespace=tps
}

devrestartpod () {
	kfd delete -f $1 && kfd apply -f $1;
	kfd get pods;
}


dpod () {
	kfd exec -ti $@ bash
}
