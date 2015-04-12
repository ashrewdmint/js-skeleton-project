# JS Skeleton Project

## About

This is a basic one-page JavaScript project which uses `bower` and `npm` for
package management, `stylus` for CSS, `browserify` for JavaScript dependency
management, and `make` for building and tasks (instead of `gulp` or `grunt`).

## Getting started

 1. Install `node` at `https://nodejs.org/download/`. Also consider using `nvm`
    to manage different versions of `node`
 1. `$ npm install`
 1. `$ make` to build the project. This will install bower components
    if they aren't already installed
 1. `$ make server` to start a server. Browsers connected to the server will
    automatically refresh if anything in `build/` changes
 1. `$ make watch` to watch for changes in `src/` and re-make them, causing
    `build/` to change, and the server to prompt browsers to refresh, if running

## Adding packages

 * `$ npm install some-package --save`, for `npm` packages
 * `$ bower install some-package --save`, for `bower` components

## Best practices

 * Prefer `npm` modules over 'bower' components; if you can install an external
   JavaScript library with either `npm` or `bower`, use `npm`.

## TODO

 * Use Jake instead of Make to eliminate the need for cryptic shell commands?
 * Use the `debowerify` transform for `browserify` or make a script that
   automatically symlinks JS files from bower components into `script/lib/`
 * Add test suite manager
 * Automatic `$ bower install` should check if all `bower` dependencies are
   fulfilled, not just for the existence of `bower_components/`
 * Make this into a `yeoman` recipe, or whatever those are called?