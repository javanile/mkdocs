
build:
	chmod +x mkdocs-entrypoint.sh
	docker build -t javanile/mkdocs .

push: build
	git add .
	git commit -am "publish" || true
	git push
	docker push javanile/mkdocs

test-help: build
	@docker run --rm -v $${PWD}:/app javanile/mkdocs --help

test-sample: build
	@docker run --rm -v $${PWD}:/app -u $$(id -u) javanile/mkdocs -f test/phpdox.xml
