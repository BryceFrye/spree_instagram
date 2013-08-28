Spree Instagram
==============

A Spree extension for curating Instagram photos on your website.

Installation
------------

Add spree_instagram and httparty to your Gemfile:

```ruby
gem 'httparty'
gem 'spree_instagram'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_instagram:install
```

Set your Instagram client id and image tag to search for in initializers/instagram.rb:

```ruby
module InstagramConfig
  CLIENT_ID = "your_client_id'
  TAG = "food"
end
```

An 'Instagram' tab will be added to admin where you can moderate the photos you wish to display.
To display an array of approved photos, simply add:

```ruby
@photos = Spree::InstagramPhoto.approved_photos
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_instagram/factories'
```

Copyright (c) 2013 [name of extension creator], released under the New BSD License
