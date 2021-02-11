
.PHONY: run-tf run-pt clean

run-pt:
	@docker run \
	--rm \
	-it \
	--gpus all \
	--workdir /root \
	--shm-size=1g \
	--ipc="host" \
	-p 8888:8888 \
	-p 6006:6006 \
	-v /mnt/e/datasets:/root/datasets \
	-v $(PWD)/src:/root/src \
	-v $(PWD)/.gitconfig:/etc/gitconfig \
	-v $(PWD)/.vimrc:/root/.vimrc \
	-v $(PWD)/.bashrc:/root/.bashrc \
	-e TERM=xterm-256color \
	nvcr.io/nvidia/pytorch:20.12-py3

run-tf:
	@docker run \
	--rm \
	-it \
	--gpus all \
	--workdir /root \
	--shm-size=1g \
	--ulimit \
	memlock=-1 \
	-p 8888:8888 \
	-p 6006:6006 \
	-v /mnt/e/datasets:/root/datasets \
	-v $(PWD)/src:/root/src \
	-v $(PWD)/.gitconfig:/etc/gitconfig \
	-v $(PWD)/.vimrc:/root/.vimrc \
	-v $(PWD)/.bashrc:/root/.bashrc \
	nvcr.io/nvidia/tensorflow:20.12-tf2-py3

run-conda:
	@docker run -t -i \
	-v $(PWD)/src:/root/src \
	-v $(PWD)/.gitconfig:/etc/gitconfig \
	-v $(PWD)/.vimrc:/root/.vimrc \
	-v $(PWD)/.bashrc:/root/.bashrc \
	-e TERM=xterm-256color \
	--workdir="/root" \
	continuumio/miniconda /bin/bash

clean: 
	docker container ls -aq | xargs --no-run-if-empty docker rm -vf
	docker image ls -aq | xargs --no-run-if-empty docker rmi -f
