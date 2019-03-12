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

```ruby
  options = {
    number: nil,
    type: nil, 
    markaspulled: "0", 
    getnotpulledonly: "0", 
    limit: 100, 
    orderdesc: "1"
  }
```

<b>number:</b>  (Optional). Get IN or OUT messsages to or from this number.

<b>type:</b> (Optional). Type of message to retrieve. Possible values: IN or OUT.

<b>markaspulled:</b>  (Optional). If you set this value in 1 you will mark your results as pulled.

<b>getnotpulledonly:</b>  (Optional). If you set this value in 1 you will retrieve only results that you don't have marked as pulled. 

<b>limit:</b>  (Default 100).

<b>orderdesc:</b>  (Default most recent). If you set this value in 0 you will retrieve result from oldest to newest.

```ruby
messages = apiwha.pull_messages(params: options)
```

``` ruby
messages = apiwha.pull_messages(params: { limit: 2 })
```

```
[
    { 
      "id":"14409287",
      "number":"391112223456",
      "from":"391112223456",
      "to":"39886677822",
      "type":"IN",
      "text":"test hello message",
      "creation_date":"2019-03-11 14:29:51",
      "process_date":"2019-03-11 14:29:51",
      "failed_date":null,
      "custom_data":null
    },
    
    { 
      "id":"14409219",
      "number":"393938491113",
      "from":"393891986619",
      "to":"393938491113",
      "type":"IN",
      "text":"test message",
      "creation_date":"2019-03-11 14:28:53",
      "process_date":"2019-03-11 14:28:53",
      "failed_date":null,
      "custom_data":null
    }
]

```


## Send Message

Allows you to send messages to any destination that wrote to you. 

<b>number:</b> Destination number. Enter the number with country code. You can check the number formatting in https://faq.whatsapp.com/en/general/21016748

<b>text:</b> Text of message to send or URL of media to send.

<i>If this text is an URL that begins with "http" and finishes with ".png" or ".jpg" the system will send a picture.</i>

<i>If this text is an URL that begins with "http" and finishes with ".ogg" the system will send an audio.</i>

<i>If this text is an URL that begins with "http" and finishes with ".pdf" the system will send the pdf document.</i>

<b>custom_data:</b> You can add your custom data in each message that you send. Then, you will receive this custom data by webhook events.


```ruby
apiwha.send_message(options)

```

## Get Credit

Allows you to query about your credit

```ruby
credit = apiwha.get_credit

```

```
{
  "credit":45
}

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
