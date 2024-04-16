IMAGE := docker.io/ministryofjustice/tech-docs-github-pages-publisher@sha256:cd3513beca3fcaf5dd34cbe81a33b3ff30337d8ada5869b40a6454c21d6f7684 # v4.0.0

preview:
	docker run --rm -it \
      --volume $$(pwd)/config:/app/config \
	  --volume $$(pwd)/source:/app/source \
	  --publish 4567:4567 \
	  $(IMAGE) /usr/local/bin/preview
