# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  1. Rails 5.0.2  
  2. Ruby 2.3.3

* Gems list
   1. Rspec
   2. Database Cleaner
   3. Capybara
   4. Faker
   5. email_validator : for validating emails addr
   6. annotate : for adding comment summarizing the current schema
      ```
      bundle exec annotate --position before
      ```
      after running see the fixtures, you'll see some comments added before
   7. std. fixtures
       dir spec/fixtures (models)
   8. Factory_girl   
       a. dir spec/support  => contains configuration 
          rails_helper.rb : uncomment "Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }"
       b. dir spec/factories
       c. add this config in spec_helper.rb
       ```
        config.before(:all) do
            FactoryGirl.reload
        end
       ``` 
       d. Methods:
          1. build -> instantiate a model without saving in DB
          2. create ->instantiate a model, creates in DB
          3. attributes_for -> returns a Hash of object attributes
          4. build_stubbed -> same as build, but creates a fake id and stops our DB interaction methods
    9. Faker gem
       add in rails_helper.rb
        ```
        require 'faker'
        ```
* Configuration

* Database creation
  1. table => Albums  : fields => title
  2. table => Users   : fields => name, email
  3. popular field added to albums
     ``` rails g migration AddPopularToAlbums popular:boolean:index```
  4. table => CartItem : fields => quantity
           many to many with user and album table
     ``` rails g model CartItem user:references album:references quantity:integer ```
* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* others
run migrations on test DB
```
rails db:migrate RAILS_ENV=test
```