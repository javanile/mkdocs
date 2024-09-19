
build:
	chmod +x docker-entrypoint.sh
	docker build -t javanile/mkdocs .

push: build
	git add .
	git commit -am "publish" || true
	git push
	docker login -u yafb
	docker push javanile/mkdocs
	docker push javanile/mkdocs:2024

test-help: build
	@docker run --rm -v $${PWD}:/app javanile/mkdocs --help

test-help-build: build
	@docker run --rm -v $${PWD}:/app javanile/mkdocs --help build

test-ls: build
	@docker run --rm -v $${PWD}:/app javanile/mkdocs ls -la

test-sh: build
	@docker run --rm -it -v $${PWD}:/app javanile/mkdocs sh

test-build: build
	@docker run --rm -v $${PWD}/test/fixtures:/app -u $$(id -u) javanile/mkdocs build --strict --verbose
