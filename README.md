# ActiveSample

Sample functionality for Active Record.

## Usage

```ruby
User.count # => 0
User.sample => nil

User.count # => 100
User.sample => #<User id: 42, ...>
User.sample(2) => #<ActiveRecord::Relation [#<User id: 1>, #<User id: 42>]>

User.count # => 100
User.sample(200) => #<ActiveRecord::Relation [All Users but shuffled]>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "active_sample"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_sample

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/JuanitoFatas/active_sample.


## License

The gem is available as open source under the terms of the [Apache License 2.0](http://www.apache.org/licenses/LICENSE-2.0).

