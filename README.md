<!--- This file is synced from hanakai-rb/repo-sync -->

[actions]: https://github.com/hanami/hanami-validations/actions
[chat]: https://discord.gg/naQApPAsZB
[forum]: https://discourse.hanamirb.org
[rubygem]: https://rubygems.org/gems/hanami-validations

# Hanami Validations [![Gem Version](https://badge.fury.io/rb/hanami-validations.svg)][rubygem] [![CI Status](https://github.com/hanami/hanami-validations/workflows/CI/badge.svg)][actions]

[![Forum](https://img.shields.io/badge/Forum-dc360f?logo=discourse&logoColor=white)][forum]
[![Chat](https://img.shields.io/badge/Chat-717cf8?logo=discord&logoColor=white)][chat]

## Installation

Add this line to your application's Gemfile:

```ruby
gem "hanami-validations"
```

And then execute:

```shell
$ bundle
```

Or install it yourself as:

```shell
$ gem install hanami-validations
```

## Usage

Installing hanami-validations enables support for `params` validation in
[hanami-controller][controller]’s `Hanami::Action` classes.

```ruby
class Signup < Hanami::Action
  params do
    required(:first_name)
    required(:last_name)
    required(:email)
  end

  def handle(req, *)
    puts req.params.class            # => Signup::Params
    puts req.params.class.superclass # => Hanami::Action::Params

    puts req.params[:first_name]     # => "Luca"
    puts req.params[:admin]          # => nil
  end
end
```

See [hanami-controller][controller] for more detail on params validation.

[controller]: http://github.com/hanami/controller

## Contributing

1. Fork it ( https://github.com/hanami/validations/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Links

- [User documentation](https://hanamirb.org)
- [API documentation](http://rubydoc.info/gems/hanami-validations)


## License

See `LICENSE` file.

