.PHONY : build-dir script style clean build default bower server watch

### Variables ##################################################################

# Use $(NPM) to run a command with local npm binary path
NPM = PATH=$$(npm bin):$$PATH

### Main #######################################################################

default: build

build: src/index.html script style
	@echo [The build is complete!]

# TODO: production -- compress CSS and JS

### Utility ####################################################################

clean:
	@echo [Cleaning build/ directory]
	@rm -rf build

build-dir:
	@echo [Creating build/ directory]
	@mkdir -p build

bower:
	@if [ ! -d "bower_components" ]; then\
		echo [No bower_components/ directory, installing...];\
		$(NPM) bower install;\
	fi

server:
	@$(NPM) livereloadx -s -p 8080 build/

watch:
	@$(NPM) watchman src "make <%= @file %>"

### Compile scripts and styles, copy files #####################################

script: bower build-dir
	@echo [Compiling javascript]
	@rm -f build/bundle.js
	$(NPM) browserify --debug src/script/*.js src/script/*/*.js -o build/bundle.js

style: bower build-dir
	@echo [Compiling stylesheets]
	@rm -f build/bundle.css
	$(NPM) stylus src/style --out build/bundle.css

src/script/* src/script/*/*: script
src/style/*: style

src/index.html: build-dir
	@echo [Copying index.html]
	@rm -f build/index.html
	@cp src/index.html build/index.html
