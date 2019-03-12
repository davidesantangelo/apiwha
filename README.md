# Apiwha

A tiny ruby wrapper around ApiWha API. If you want know more visit http://www.apiwha.com website.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiwha'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install apiwha

## Usage

```ruby
require 'apiwha'
apiwha = Apiwha.new('Your secret API key')

```
Your secret API key. You can generate it in your dashboard from https://panel.apiwha.com/

## Pull Messages

Allows you to pull the messages you received and sent.

### Options

type: (Optional). Type of message to retrieve. Possible values: IN or OUT.

number: (Optional). Get IN or OUT messsages to or from this number.

markaspulled: (Optional). If you set this value in 1 you will mark your results as pulled.

getnotpulledonly: (Optional). If you set this value in 1 you will retrieve only results that you don't have marked as pulled. 

limit: (Default 100).

orderdesc: (Default most recent). If you set this value in 0 you will retrieve result from oldest to newest.

```ruby
messages = apiwha.pull_messages(options)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/apiwha. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Apiwha project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/apiwha/blob/master/CODE_OF_CONDUCT.md).
