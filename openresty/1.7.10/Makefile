include ../../common.mk

EXTRA_DOCKER_RUN_OPT=-p 80:80 \
	-v $(CURRENT_DIR)/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf

DOCKER_BASH_CMD=/bin/bash