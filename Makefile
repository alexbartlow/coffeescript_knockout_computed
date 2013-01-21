.PHONY: test
test:
	jasmine-node --coffee --verbose spec/

build: src/*.coffee
	coffee -b -c -o build src 
