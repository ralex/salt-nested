all: build run
.PHONY : all

build:
	docker build . -f Dockerfile.salt -t ralex/salt
	docker build . -f Dockerfile.vbox -t ralex/vbox
	docker build . --build-arg USER -t ralex/salt-cloudbox

run:
	docker run -ti --rm \
	    --name salt-cloudbox \
	    --device=/dev/vboxdrv \
	    --network=host \
	    -v /tmp:/tmp \
	    -v /dev/vboxdrv:/dev/vboxdrv \
	    -v /home/$(USER)/.config/VirtualBox:/home/$(USER)/.config/VirtualBox \
	    -v /home/$(USER)/VirtualBox\ VMs:/home/$(USER)/VirtualBox\ VMs \
	    -v /home/$(USER)/.vagrant.d:/home/$(USER)/.vagrant.d \
	    ralex/salt-cloudbox:latest /bin/bash
