# RailsInvitable
Make the invitation function plugable.

## Requirement
* User has class ApplicationController with method current_user avaiable there.
* User class which the name can be configured.

## Usage
```ruby
# config/initializer/rails_invitable.rb
RailsInvitable.user_class = "User" # Or other user class name used in your project. Should be a string or symbol.
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_invitable'
```

And then execute:
```bash
$ bundle
```

Run install generator
```bash
$ bundle exec rails g rails_invitable:intall
```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
