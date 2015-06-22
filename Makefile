#
#
#
all: 


build:
	chmod +x service.d/*/run
	sudo docker build -t jdougan/base-xrfb-libreoffice:1 .

run:
	sudo docker run -p 5900:5900 jdougan/base-xrfb-libreoffice:1

clean: 
	sudo docker rmi jdougan/base-xrfb-libreoffice:1

cleanc:
	docker ps -a | grep 'Exited' | awk -f tools/first.awk | xargs --no-run-if-empty docker rm -v

gcim:
	docker ps -a | grep 'dsfsd' | awk -f tools/first.awk | xargs --no-run-if-empty docker rmi  
