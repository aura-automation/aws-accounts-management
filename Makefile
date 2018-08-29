DEVUSER ?= ${USER}
current_dir = $(shell pwd)

docker-build: 
	docker build -t ${DEVUSER}-build config

docker-it: docker-build 
	docker run -it --rm \
	-v ${current_dir}:/app \
	-v ${HOME}/.aws:/root/.aws \
	-w /app \
	-e ANSIBLE_CONFIG=/app/infrastructure/ansible.cfg \
	${DEVUSER}-build \
	/bin/bash

deploy:
	ansible-playbook infrastructure/main.yml --extra-vars "tf_mode=${tf_mode} extra_param=${extra_param}"

deploy-plan: tf_mode=plan extra-param=
deploy-plan: deploy


deploy-apply: tf_mode=apply extra_param='-auto-approve'
deploy-apply: deploy


destroy-plan:  tf_mode='plan -destroy' extra_param=
destroy-plan: deploy

destroy: extra_param='-auto-approve' tf_mode='destroy' 
destroy: deploy

