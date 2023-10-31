
build:
	chmod +x docker-entrypoint.sh
	docker build -t javanile/mkdocs .

push: build
	git add .
	git commit -am "publish" || true
	git push
	docker push javanile/mkdocs

test-help: build
	@docker run --rm -v $${PWD}:/app javanile/mkdocs --help

test-help-build: build
	@docker run --rm -v $${PWD}:/app javanile/mkdocs --help build

test-ls: build
	@docker run --rm -v $${PWD}:/app javanile/mkdocs ls

test-build: build
	@docker run --rm -v $${PWD}:/app -u $$(id -u) javanile/mkdocs build --strict --verbose
