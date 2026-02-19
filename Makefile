GEM_NAME = bureaucrat-sc
GEM_SPEC = $(GEM_NAME).gemspec
GEM_VERSION = $(shell ruby -e 'puts Gem::Specification.load("$(GEM_SPEC)").version')
GEM = $(GEM_NAME)-$(GEM_VERSION).gem

dist: $(GEM)

$(GEM): $(GEM_SPEC)
	gem build $(GEM_SPEC)

.PHONY: setup
setup:
	bundle install

.PHONY: test
test:
	bundle exec rspec

integration-test:

clean:
	rm -f *.gem
