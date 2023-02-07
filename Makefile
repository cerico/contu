NPM_TOKEN=$(shell awk -F'=' '{print $$2}' ~/.npmrc)
generate:
	./bin/init.js
npm:
	@echo $(NPM_TOKEN) > .git/npm
	gh secret set NPM_TOKEN < .git/npm
	rm .git/npm
repo:
	gh repo create contu --public
	git remote add origin git@github.com:cerico/contu.git

