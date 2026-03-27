# AGENTS

## Update Ruby

```sh
$ mise use -g ruby@4.0.0
$ gem update --system
$ gem install bundler
$ bundle update --bundler
$ bundle update --ruby

# Update version in .ruby-version and Dockerfile (FROM ruby:X.X.X-slim)
# git commit -am "Update Ruby to 4.0.0"
```

## Update Node.js

```sh
$ mise use -g node@24.14.0

# Update version in .node-version and Dockerfile (ARG NODE_VERSION)
# git commit -am "Update Node.js to 24.14.0"
```

## Update Dependencies

```sh
$ bundle update
$ yarn upgrade

# git commit -am "Update dependencies"
```
