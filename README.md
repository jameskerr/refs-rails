# Refs Rails

A Rails gem for managing string identifiers in a centralized, type-safe way. Good for form IDs, CSS classes, data attributes, and any other string constants you want to keep organized.

## Why Refs Rails?

Instead of scattering magic strings throughout your Rails application:

```erb
<!-- Scattered magic strings -->
<form id="user-settings-form"></form>
```

```rb
turbo_stream.replace "user-settings-form"
```

Define them once and reference them everywhere:

```ruby
# config/refs.rb
Refs.define do
  ref :user_settings_form
  ref :user_settings_panel
  ref :user_settings_email_input
end
```

```erb
<form id="<%= ref.user_settings_form %>"></form>
```

```rb
turbo_stream.replace ref.user_settings_form
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem "refs-rails"
```

## Usage

### 1. Define Your References

Create a file at `config/refs.rb` in your Rails application:

```ruby
# config/refs.rb
Refs.define do
  # Form identifiers
  ref :login_form
  ref :signup_form
  ref :user_settings_form
end
```

### 2. Use in Views

Each ref you define is turned into a method on the `ref` object and automatically available in your views and controllers:

```erb
<form id="<%= ref.login_form %>"></form>
```

```rb
render turbo_stream: turbo_stream.replace ref.login_form
```

## Benefits

This library helps centralize all your DOM ids, which are frequently needed in a default Rails app with a hotwire frontend. It will help you find your bugs faster with method errors when the template renders, rather than JavaScript errors when you are click-testing.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jameskerr/refs-rails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
