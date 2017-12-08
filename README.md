# geekbot_ruby

[![CircleCI](https://circleci.com/gh/standfirm/geekbot_ruby.svg?style=svg)](https://circleci.com/gh/standfirm/geekbot_ruby)

Geekbot API library, written in Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geekbot'
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install geekbot
```

## Usage

```ruby
# Initialization
client = Geekbot::Client.new(access_token: "<your_access_token>")

# Team API
client.index_teams
#=> GET /v1/teams

# Report API
client.index_reports
#=> GET /v1/reports

# Standup API
client.index_standups
#=> GET /v1/standups

client.show_standup(id: xxx)
#=> GET /v1/standups/:id

client.create_standup(params: param)
#=> POST /v1/standups

client.update_standup(id: xxx, params: param)
#=> PATCH /v1/standups/:id

client.replace_standup(id: xxx, params: param)
#=> PUT /v1/standups/:id

client.destroy_standup(id: xxx)
#=> DELETE /v1/standups/:id
```
see also: [Geekbot API Docs](https://geekbot.io/developers)

## Contributing

1. Fork it ( https://github.com/standfirm/geekbot_ruby/fork )
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create a new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
