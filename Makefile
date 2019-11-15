.PHONY: login
login:
	echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
.PHONY: build
build:
	docker build --network=host -t valouille/echo .

.PHONY: push
push:
	docker push valouille/echo:latest
