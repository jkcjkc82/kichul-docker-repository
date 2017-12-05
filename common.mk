# cygwin에서 HOME 변수에 따른 문제
DOCKER=/cygdrive/c/Windows/system32/cmd.exe /C "%cd%/../../docker-cygwin.bat"

# 현재 디렉토리 가져오기
CURRENT_DIR:=$(shell /cygdrive/c/Windows/system32/cmd.exe /C echo %cd%)

# 현재 디렉토리 \를 /로 치환
CURRENT_DIR:=$(shell CUR="${CURRENT_DIR}" ; echo $${CUR//\\/\/})

# C: 을 /c로 변경
CURRENT_DIR:=$(shell echo ${CURRENT_DIR} | sed -e 's/\([C-Z]\+\)\:/\/\L\1/g')

CONTAINER_NAME=lua-apache-backend
IMAGE_NAME=jkcjkc82/$$(cd .. ; basename "$$PWD"):$$(basename "$$PWD")
CONTAINER_NAME=$$(cd .. ; basename "$$PWD")-$$(basename "$$PWD")-con

EXTRA_DOCKER_RUN_OPT=
DOCKER_BASH_CMD=/bin/bash

tutorial:
	@echo 
	@echo Commands:
	@echo 
	@echo "  "docker-build
	@echo "  "docker-run
	@echo "  "docker-push
	@echo "  "docker-rm

# TEST_VAL=1

# re2:
# 	echo "re2"
# 	$(eval TEST_VAL=$(TEST_VAL)-1)

# re1: re2
# 	@echo $(TEST_VAL)


docker-build:
	@$(DOCKER) build -t $(IMAGE_NAME) .
	@echo "$(IMAGE_NAME) image created."

docker-run:
	$(DOCKER) run -it --rm \
		--name $(CONTAINER_NAME) \
		--dns=10.0.0.10 \
		-v $(CURRENT_DIR):/myvol \
		--entrypoint /myvol/docker-entrypoint.sh \
		$(EXTRA_DOCKER_RUN_OPT) \
		$(IMAGE_NAME) \
		$(DOCKER_BASH_CMD)

docker-exec:
	$(DOCKER) exec -it \
		$(CONTAINER_NAME) \
		$(DOCKER_BASH_CMD)

docker-rm:
	@echo $(DOCKER) rm -f $(CONTAINER_NAME)
	@$(DOCKER) rm -f $(CONTAINER_NAME)

docker-push:
	$(DOCKER) push $(IMAGE_NAME)