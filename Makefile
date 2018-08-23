# setup development
setup:
	@./hack/setup_dev.sh
.PHONY: setup

# install tools
install:
	@./hack/install.sh
.PHONY: install
