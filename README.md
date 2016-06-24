# Nmax

Nmax is command line tool thar allow find maximal numbers from input stream

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'nmax'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nmax

## Command-line usage

``` sh
# show N of max numbers from input stream
$ nmax -n 100

# show only uniq numbers
$ nmax -n 100 --uniq

# show numbers by stream order
$ nmax -n 100 --keep-order
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/silentfl/nmax


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

