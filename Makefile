install-console:
	@bash ./install/console.sh

install-heavy-clients:
	@bash ./install/heavy_clients.sh

install:
	@make install-console
	@make install-heavy-clients
