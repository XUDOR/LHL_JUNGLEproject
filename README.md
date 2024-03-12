# Submission for Code Review 
by: Roderick Shoolbraid / Lighthouse Labs Student.
This assignment was completed with the use of:
Google
Perplexity.ai
ChatGpt4
-tutorial from Github:
https://gist.github.com/thebucknerlife/10090014
https://stevepolito.design/blog/rails-authentication-from-scratch
https://rubygems.org/gems/bcrypt/versions/3.1.12?locale=en

** In accordance with the AI mandate by Lighthouse Labs **

__________________________________________________________
# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
