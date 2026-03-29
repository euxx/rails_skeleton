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

## Code Quality

A pre-commit hook (`.githooks/pre-commit`) runs RuboCop and Brakeman automatically.
Activate it once after cloning: `git config core.hooksPath .githooks`

Run before committing:
```sh
$ bin/rubocop -A          # auto-correct lint offenses
$ bin/brakeman --no-pager # security static analysis
$ bin/rails test:all
```

Common RuboCop rules enforced by `rubocop-rails-omakase`:
- `Style/TrailingCommaInHashLiteral` — multiline hashes require a trailing comma after the last item
- `Style/TrailingCommaInArrayLiteral` — same for multiline arrays
