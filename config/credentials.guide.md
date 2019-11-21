# Rails Credentials

## Setup

Run the following commands
```sh
$ rm config/credentials.yml.enc     # Remove the default credentials file
$ EDITOR=vim rails credentials:edit # Create new master key and credentials file
```

Save the master key and keep it safe

## Production

Recommend creating a credentials file for production

```sh
$ rails secret # Generate a new secret
$ EDITOR=vim rails credentials:edit --environment production
```

Add the new secret to the opened `credentials.yml`
```yml
secret_key_base: new_secret
```

Ensure a master key is available
```rb
# config/environments/production.rb
config.require_master_key = true
```

## Example

Edit by the command
```sh
$ EDITOR=vim rails credentials:edit
```

Add API keys to the opened `credentials.yml`
```yml
key: value
```

Use by
```rb
Rails.application.credentials.key # => 'value'
```

For more details with `$ rails credentials:help`
