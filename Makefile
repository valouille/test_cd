CURRENT_COMMIT = $(shell git rev-parse HEAD)

.PHONY: login
login:
	echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin
.PHONY: build
build:
	docker build --network=host -t valouille/echo .

.PHONY: push
push:
	docker tag valouille/echo:latest valouille/echo:${CURRENT_COMMIT}
	docker push valouille/echo:${CURRENT_COMMIT}
