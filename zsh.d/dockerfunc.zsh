#!/bin/env zsh
# based on https://github.com/jessfraz/dotfiles/blob/0b198fce47d8b4437341f850e0fdcced6af3cbca/.dockerfunc

export DOCKER_REPO_PREFIX=jess

#
# Helper Functions
#
function dcleanup(){
	local containers
	mapfile -t containers < <(docker ps -aq 2>/dev/null)
	docker rm "${containers[@]}" 2>/dev/null
	local volumes
	mapfile -t volumes < <(docker ps --filter status=exited -q 2>/dev/null)
	docker rm -v "${volumes[@]}" 2>/dev/null
	local images
	mapfile -t images < <(docker images --filter dangling=true -q 2>/dev/null)
	docker rmi "${images[@]}" 2>/dev/null
}
function del_stopped(){
	local name=$1
	local state
	state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

	if [[ "$state" == "false" ]]; then
		docker rm "$name"
	fi
}
function rmctr(){
	# shellcheck disable=SC2068
	docker rm -f $@ 2>/dev/null || true
}
function relies_on(){
	for container in "$@"; do
		local state
		state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

		if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
			echo "$container is not running, starting it for you."
			$container
		fi
	done
}
# creates an nginx config for a local route
function nginx_config(){
	server=$1
	route=$2

	cat >"${HOME}/.nginx/conf.d/${server}.conf" <<-EOF
	upstream ${server} { server ${route}; }
	server {
	server_name ${server};
	location / {
	proxy_pass  http://${server};
	proxy_http_version 1.1;
	proxy_set_header Upgrade \$http_upgrade;
	proxy_set_header Connection "upgrade";
	proxy_set_header Host \$http_host;
	proxy_set_header X-Forwarded-Proto \$scheme;
	proxy_set_header X-Forwarded-For \$remote_addr;
	proxy_set_header X-Forwarded-Port \$server_port;
	proxy_set_header X-Request-Start \$msec;
}
	}
	EOF

	# restart nginx
	docker restart nginx

	# add host to /etc/hosts
	hostess add "$server" 127.0.0.1

	# open browser
	browser-exec "http://${server}"
}

#
# Container Aliases
#
function rainbowstream(){
	docker run -it --rm \
		-v /etc/localtime:/etc/localtime:ro \
		-v "${HOME}/.rainbow_oauth:/root/.rainbow_oauth" \
		-v "${HOME}/.rainbow_config.json:/root/.rainbow_config.json" \
		--name rainbowstream \
		${DOCKER_REPO_PREFIX}/rainbowstream
}

function dgcloud(){
	docker run --rm -it \
		-v "${HOME}/.gcloud:/root/.config/gcloud" \
		-v "${HOME}/.ssh:/root/.ssh:ro" \
		-v "$(command -v docker):/usr/bin/docker" \
		-v /var/run/docker.sock:/var/run/docker.sock \
		--name gcloud \
		${DOCKER_REPO_PREFIX}/gcloud "$@"
}

compdef dgcloud=gcloud
