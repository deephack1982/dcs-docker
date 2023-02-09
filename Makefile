build:
	docker build -t deephack/dcs-docker .

run:
	docker run --rm \
	-e USER=dcsuser  \
	-e PASSWORD=password  \
	-e VNC_PASSWORD=lemon123  \
	-e WORKDIR=training   \
	-p 5900:5900 \
	-p 10310:10310/tcp \
	-p 10310:10310/udp \
	-v /dev/shm:/dev/shm  \
	-v ~/dcs:/home/dcsuser \
	--name dcsserver deephack/dcs-docker:latest

push:
  docker push deephack/dcs-docker:latest