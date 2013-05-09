js: build/confirm_with_reveal.js
jsmin: build/confirm_with_reveal.min.js

build/confirm_with_reveal.js:
	coffee --output build --compile confirm_with_reveal.coffee

build/confirm_with_reveal.min.js:
	yuicompressor -o build/confirm_with_reveal.min.js \
	  build/confirm_with_reveal.js

clean:
	rm build/*

all: build/confirm_with_reveal.js build/confirm_with_reveal.min.js