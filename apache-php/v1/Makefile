include ../../common.mk

EXTRA_DOCKER_RUN_OPT=-p 80:80 \
	-v $(CURRENT_DIR)/httpd.conf:/etc/httpd/conf/httpd.conf \
	-v $(CURRENT_DIR):/var/www/html

DOCKER_BASH_CMD=/bin/bash