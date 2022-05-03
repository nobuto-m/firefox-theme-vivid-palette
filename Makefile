SHELL=/bin/bash

.PHONY: build
build:
	@rm -fv theme.zip
	zip theme.zip manifest.json

.PHONY: randomize
randomize:
	@paste -d : \
	    <(cat manifest.json | jq '.theme.colors | keys[]') \
	    <(grep -v '^#' colors.list | cut -d' ' -f1 | sort -R) \
	    | sed -e '/^:/d;s/:/: /;s/^/      /'
