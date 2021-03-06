# Rails skeleton

[![Build Status](https://semaphoreci.com/api/v1/eux/rails_skeleton/branches/master/badge.svg)](https://semaphoreci.com/eux/rails_skeleton)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/eff349d9f6a742d7bfa1f7fb8a4a3a4f)](https://www.codacy.com/manual/eux/rails_skeleton/dashboard)

Rails skeleton with Ruby 3.0 and Rails 6.1
-- [preview online](https://skeleton.eux.one)

In favor of

- [PostgreSQL](https://github.com/ged/ruby-pg)
- [Webpacker](https://github.com/rails/webpacker)
- [Stimulus](https://github.com/stimulusjs/stimulus)
- [Rails Credentials](https://edgeguides.rubyonrails.org/security.html#custom-credentials)
- [Active Storage](https://edgeguides.rubyonrails.org/active_storage_overview.html)
- [Bootstrap](https://github.com/twbs/bootstrap)
- [FontAwesome](https://github.com/FortAwesome/font-awesome-sass)
- [Authlogic](https://github.com/binarylogic/authlogic)
- [Sidekiq](https://github.com/mperham/sidekiq)

In favor of services

- [Semaphore](https://semaphoreci.com) for CI
- [Codacy](https://www.codacy.com) for code quality
- [Skylight](https://www.skylight.io) for performance monitoring
- [Sentry](https://sentry.io) for error tracking

## Getting Started

```sh
$ bin/setup app_name=your_app_name
$ rails test:system test
$ rails s
```

## Edit Things

- Rename the repository to your_app_name

- Setup credentials by following
  [config/credentials.guide.md](https://github.com/euxx/rails_skeleton/blob/master/config/credentials.guide.md)

- Add necessary API keys by following
  [config/credentials.yml.sample](https://github.com/euxx/rails_skeleton/blob/master/config/credentials.yml.sample)

- Set `TAG_ENV` environment variable to specific server environment like 'production' (default is 'staging') for Sentry and Skylight

- Edit `title`, `keywords` and `description` at HTML Head in
  `app/views/layouts/application.html.erb`

- Replace `app/webpacker/images/favicon.png` with yours

- Custom errors page in `app/views/errors/`

- Update README

## Tips

- Use webpack to manage `javascripts`, `stylesheets` and `images` assets,
  and rename `app/javascript` to `app/webpacker` to make more sense

- There's a helper `icon(style, name, text = nil, html_options = {})`
  to generate Font Awesome icons
