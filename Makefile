.PHONY: package preview

.DEFAULT_GOAL := preview

TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE     ?= ghcr.io/ministryofjustice/tech-docs-github-pages-publisher
TECH_DOCS_GITHUB_PAGES_PUBLISHER_IMAGE_SHA ?= sha256:35699473dbeefeeb8b597de024125a241277ee03587d5fe8e72545e4b27b33f8 # v5.0.0

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
