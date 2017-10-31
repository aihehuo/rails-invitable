# RailsInvitable
Make the invitation function plugable.

## Requirement
* Host application **must** has `ApplicationController` class with method `current_user` avaiable.
* `User` model **must** exists, but the name of the model can be configured.
* User instance should be able to respond to public method `admin?`, the result should be `true` or `false`.
* Each user has a uniq `id` and `openid`.
* Only `zh-CN` translation is supported.
* `Pingpp` gem is mandatory for payment implementation. And `pingpp_app_id` needs to be configured.
* User has a method `phone` which can get its phone number.

## Usage
#### Red_pocket
User will have a new column with attribute red_pocket. Which holds the information of his remaining red_pocket money.

#### 配置
```ruby
# config/initializer/rails_invitable.rb
RailsInvitable.user_class = "User" # Or other user class name used in your project. Should be a string or symbol.
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_invitable', :git => 'git://github.com/aihehuo/rails-invitable.git'
```

And then execute:
```bash
$ bundle
```

Run install generator
```bash
$ bundle exec rails g rails_invitable:install
```

## Development
#### Test
```bash
bundle exec rails test
```
## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
