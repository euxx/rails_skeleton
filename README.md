# Rails skeleton

[![Build Status](https://semaphoreci.com/api/v1/eux/rails_skeleton/branches/master/badge.svg)](https://semaphoreci.com/eux/rails_skeleton)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/eff349d9f6a742d7bfa1f7fb8a4a3a4f)](https://www.codacy.com/manual/euxx/rails_skeleton?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=euxx/rails_skeleton&amp;utm_campaign=Badge_Grade)

Rails skeleton with Ruby 2.6.3 and Rails 6.0

In favor of

- [PostgreSQL](https://github.com/ged/ruby-pg)
- [Webpacker](https://github.com/rails/webpacker)
- [Stimulus](https://github.com/stimulusjs/stimulus)
- [Bootstrap](https://github.com/twbs/bootstrap)
- [Bootstrap Form](https://github.com/bootstrap-ruby/bootstrap_form)
- [FontAwesome](https://github.com/FortAwesome/font-awesome-sass)

[Preview online](https://skeleton.eux.one)

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

- Edit `title`, `keywords` and `description` at HTML Head in
  `app/views/layouts/application.html.erb`

- Replace `app/webpacker/images/favicon.ico` with yours

- Update README

## Tips

- Use webpack to manage `javascripts`, `stylesheets` and `images` assets,
  and rename `app/javascript` to `app/webpacker` to make more sense

- There's a helper `icon(style, name, text = nil, html_options = {})`
  to generate Font Awesome icons
