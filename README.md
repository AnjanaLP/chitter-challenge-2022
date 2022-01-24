# Chitter
Chitter is a small Twitter clone that allows users to post peeps (messages) to a public stream. Compared to previous Sinatra applications where I have integrated a database using the pg gem and SQL queries, for this application I have chosen to use a Object Relational Mapper as the database interface. This application has been built using Sinatra, PostgreSQL and ActiveRecord.

Users sign up to Chitter with their email, password, name and a username. Validations have been implemented on the client side, in the model and also in the database. A user does not need to be logged in to see peeps but does need to log in to post peeps.
Peeps have the name of the maker, their user handle and timestamp.

The user stories below have been implemented using TDD and following a BDD cycle. Feature tests have been written in Capybara and unit tests in raw RSpec. Tests have also made use of three gems - factory bot to build and create test objects, database cleaner to ensure each test starts on an empty database, and timecop to test the time-dependent code (testing a peep's timestamp and testing peeps are displayed in reverse chronological order). Spec helper methods have been extracted into their own module. Test coverage is 100%.

More complex business logic has been refactored by adding class methods to the relevant model. Routes have been split into separate controller files and follow RESTful naming conventions. Helper methods have been extracted to a view helpers file. Partials have been used for flash messages and navigation links.

## User stories
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```

## How to use

### Install project dependencies
Clone the repo to your local machine, change into the directory, then:
```
$ bundle install
```

### Setup the databases
```
$ rake db:create
$ rake db:migrate
$ rake db:migrate RACK_ENV=test
```

### Run the app
```
$ rackup
```
Visit http://localhost:9292

### Run tests
```
$ rspec
```

## Technologies used
* ActiveRecord
* CSS
* Capybara
* HTML
* PostgreSQL
* Ruby
* RSpec
* Sinatra
