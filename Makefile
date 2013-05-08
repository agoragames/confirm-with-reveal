js: build/confirm_with_reveal.js
jsmin: build/confirm_with_reveal.min.js

build/confirm_with_reveal.js: confirm_with_reveal.js.coffee
	coffee --output build --compile confirm_with_reveal.js.coffee && \
	  mv build/confirm_with_reveal.js.js build/confirm_with_reveal.js

build/confirm_with_reveal.min.js: build/confirm_with_reveal.js
	yuicompressor -o build/confirm_with_reveal.min.js \
	  build/confirm_with_reveal.js

clean:
	rm build/*
