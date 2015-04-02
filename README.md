# Mustache::Sinatra

[![Build Status](https://travis-ci.org/mustache/mustache-sinatra.svg)](https://travis-ci.org/mustache/mustache-sinatra)

Support for Mustache in your Sinatra app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mustache-sinatra'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mustache-sinatra

## Usage

```ruby
require 'mustache/sinatra'

class Hurl < Sinatra::Base
  register Mustache::Sinatra

  set :mustache, {
    # Should be the path to your .mustache template files.
    :templates => "path/to/mustache/templates",

    # Should be the path to your .rb Mustache view files.
    :views => "path/to/mustache/views",

    # This tells Mustache where to look for the Views module,
    # under which your View classes should live. By default it's
    # the class of your app - in this case `Hurl`. That is, for an :index
    # view Mustache will expect Hurl::Views::Index by default.
    # If our Sinatra::Base subclass was instead Hurl::App,
    # we'd want to do `set :namespace, Hurl::App`
    :namespace => Hurl
  }

  get '/stats' do
    mustache :stats
  end
end
```

As noted above, Mustache will look for `Hurl::Views::Index` when
`mustache :index` is called.

If no `Views::Stats` class exists Mustache will render the template
file directly.

You can indeed use layouts with this library. Where you'd normally
<%= yield %> you instead {{{yield}}} - the body of the subview is
set to the `yield` variable and made available to you.

If you don't want the Sinatra extension to look up your view class,
maybe because you've already loaded it or you're pulling it in from
a gem, you can hand the `mustache` helper a Mustache subclass directly:

```ruby
# Assuming `class Omnigollum::Login < Mustache`
get '/login' do
  @title = "Log In"
  require 'lib/omnigollum/views/login'
  mustache Omnigollum::Login
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mustache-sinatra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
