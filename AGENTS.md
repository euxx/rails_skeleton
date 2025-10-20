# AGENTS

## Update Ruby

```sh
$ mise use -g ruby@3.4.7
$ gem update --system
$ gem install bundler
$ bundle update --bundler
$ bundle update --ruby

# update version in .ruby-version, Dockerfile
# git commit -am "Update Ruby to 3.4.7"
```

## Update Dependencies

```sh
$ bundle update
$ yarn upgrade

# git commit -am "Update dependencies"
```
