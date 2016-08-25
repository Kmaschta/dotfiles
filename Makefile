install-console:
	@bash ./install/console.sh

install-dev:
	@bash ./install/dev.sh

install-heavy-clients:
	@bash ./install/heavy_clients.sh

install:
	@make install-console
	@make install-dev
	@make install-heavy-clients
