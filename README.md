# Rails skeleton

[![Build Status](https://semaphoreci.com/api/v1/eux/rails_skeleton/branches/master/badge.svg)](https://semaphoreci.com/eux/rails_skeleton)

Rails skeleton with Ruby 2.6.3 and Rails 6.0

In favor of

- [PostgreSQL](https://github.com/ged/ruby-pg)
- [Webpacker](https://github.com/rails/webpacker)
- [Stimulus](https://github.com/stimulusjs/stimulus)
- [Bootstrap](https://github.com/twbs/bootstrap)
- [FontAwesome](https://github.com/FortAwesome/font-awesome-sass)

[Preview online](https://skeleton.eux.one)

## Getting Started

```bash
$ bin/setup app_name=your_app_name
$ rails test:system test
$ rails s
```

## Edit Things

- Rename the repository to your_app_name

- Edit `title`, `keywords` and `description` at HTML Head in
  `app/views/layouts/application.html.erb`

- Replace `app/webpacker/images/favicon.ico` with yours

- Update README

## Tips

- Use webpack to manage `javascripts`, `stylesheets` and `images` assets,
  and rename `app/javascript` to `app/webpacker` to make more sense

- There's a helper `icon(style, name, text = nil, html_options = {})`
  to generate Font Awesome icons
