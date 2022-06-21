.PHONY: prerequisites serve-watch build install test

all: serve-drafts-watch

prerequisites:
	sudo apt-get -y install ruby-full build-essential ||:
	gem install bundler
	bundle install
	$$(MAKE) -s install-imagemagick

install-imagemagick:
	@echo "Installing imagemagick"
	brew install imagemagick ||:
	sudo apt-get update
	sudo apt-get install imagemagick -y

serve-watch:
	@echo "Serving from http://127.0.0.1:4000/"
	JEKYLL_ENV=local bundle exec jekyll serve --watch

serve-drafts-watch:
	@echo "Serving from http://127.0.0.1:4000/"
	JEKYLL_ENV=development JEKYLL_LOG_LEVEL=error bundle exec jekyll serve --watch --drafts --unpublished --future \
		--strict_front_matter --livereload

test:
	exit 0

update:
	bundle update