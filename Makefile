.PHONY: help serve build clean

TODAY := $(shell date +"%m-%d")

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

push: ## pushes changes
	git add -A
	git commit -m "Update $(TODAY)" --allow-empty
	git pull origin main
	git push origin main
