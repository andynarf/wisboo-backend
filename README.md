# Wisboo recruitment assignament

API service to create/delete and view comments on videos using Ruby on Rails.

## Tech stack

* Ruby on Rails as REST API.
* Deployed on [Heroku.](https://www.heroku.com/)
* Production database [PostgreSQL.](https://www.postgresql.org/)
* Tests using [rspec](https://github.com/rspec/rspec-rails), [factory-bot](https://github.com/thoughtbot/factory_bot_rails), [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers), [database-cleaner](https://github.com/DatabaseCleaner/database_cleaner) & [faker.](https://github.com/faker-ruby/faker)

## How to install:



#### Clone the project

To download the project simply run: 

`git clone git@github.com:codingAngarita/bookMe.git`

or

`git clone https://github.com/codingAngarita/bookMe.git`

Then move into the created directory `cd bookMe`

#### Ruby Version

This projects uses `ruby 2.7.0` you can install ruby using [RVM](https://rvm.io/) or check the [ruby language page](https://www.ruby-lang.org/es/).

### Database

To run this project locally you should provide the local PostgreSQL `role` and `password` you can check [this guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres) for mor info.

#### Install PostgreSQL

Install PostgreSQL and it's required development libraries.

`sudo apt install postgresql postgresql-contrib libpq-dev`

#### Creating a Role

The `role` as it's called on Postgre it's basically your username, using this role rails will create and communicate with the Database.

`sudo -u postgres createuser -s YOUR_DB_ROLE_NAME -P`

`sudo -u` Allows to run the `createuser` command ussing the `postgres` role thats automatically created upon installing.

The `-s` flag will tell posrgres to create a user with super user privileges, and using the `-P` flag you will be asked to enter a password for your new role.


### Gems

#### Install Bundler

This project uses `bundler 2.0.2` check if you have it installed using `bundler --version`.

You can install the bundler gem using running:

`gem install bundler -v 2.0.2`

#### Install required gems

Run the command `bundle` or `bundle install`.

### Final setup

Once you are done following the previous steps you should run:

1. `rails db:create` to create the local database.
2. `rake db:migrate` to run any pending migrations.

You can now start the server by running `rails s`


## API documentation 

Check the [API documentation](https://web.postman.co/collections/11604206-26ea5629-87d7-4411-96e4-e04e14bc843b?version=latest&workspace=23cf6137-c662-4f5d-8f89-aeeaabcc63e4)


## Authors
  👤 Andres Rodriguez

Github: [@andynarf](https://github.com/andynarf)

## 🤝 Contributing
Contributions, issues and feature requests are welcome!

Show your support
Give a ⭐️ if you like this project!


## 📝 License
This project is MIT licensed.