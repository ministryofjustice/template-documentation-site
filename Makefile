.PHONY: package preview

.DEFAULT_GOAL := preview

TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE     ?= ghcr.io/ministryofjustice/tech-docs-github-pages-publisher
TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE_SHA ?= sha256:7c0508cf2d199c1b3f0f67e4872023d5399425fead9b2bb2ca461f72c5f409a3 # v6.2.0-1

package:
	docker run --rm \
	    --name tech-docs-github-pages-publisher \
	    --volume $(PWD)/config:/tech-docs-github-pages-publisher/config \
		--volume $(PWD)/source:/tech-docs-github-pages-publisher/source \
		$(TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE)@$(TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE_SHA) \
		/usr/local/bin/package

preview:
	docker run -it --rm \
	    --name tech-docs-github-pages-publisher-preview \
	    --volume $(PWD)/config:/tech-docs-github-pages-publisher/config \
		--volume $(PWD)/source:/tech-docs-github-pages-publisher/source \
		--publish 4567:4567 \
		$(TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE)@$(TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE_SHA) \
		/usr/local/bin/preview

link-check:
	lychee --verbose --no-progress './**/*.md' './**/*.html' './**/*.erb' --accept 403,200,429
