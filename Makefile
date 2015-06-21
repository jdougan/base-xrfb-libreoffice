#
#
#
all: 


build:
	sudo docker build -t jdougan/base-xrfb-libreoffice:1 .

run:
	sudo docker run -p 5900:5900 jdougan/base-xrfb-libreoffice:1

clean: 
	sudo docker rmi jdougan/base-xrfb-libreoffice:1

cleanc:
	docker ps -a | grep 'Exited' | awk "{print \$1}" | xargs --no-run-if-empty docker rm -v

gcim:
	docker ps -a | grep 'dsfsd' | awk '{print \$1}' | xargs --no-run-if-empty docker rmi  
