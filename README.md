# Refs

The standard way to dynamically update HTML content in Ruby on Rails relies heavily on DOM IDs. Managing these IDs can be cumbersome, verbose, and error-prone.

This very small library gives you a central place to define IDs and a helper object to access them in views and controllers.

Instead of scattering magic strings throughout your Rails application, define them once and reference them safely in Ruby.

Read the motivation behind the gem here: [DOM IDs are a real pain in my apps](https://www.jameskerr.blog/posts/2025/refs-rails/)

## Why?

Here's a very simple example of replacing content on the page with a turbo stream. As you can see, you need these two string IDs to remain in sync.

```erb
<form id="user-settings-form"></form>
```

```rb
turbo_stream.replace "user-settings-form"
```

Here's how you'd do it with refs. First, define the ref in `config/refs.rb`, the call the helper method on the `ref` object in views and controllers.

```ruby
# config/refs.rb
Refs.define do
  ref :user_settings_form
end
```

```erb
<form id="<%= ref.user_settings_form %>"></form>
```

```rb
turbo_stream.replace ref.user_settings_form
```

Instead of catching the error in JavaScript during a click test, you'll catch it when the template renders.

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jameskerr/refs-rails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
