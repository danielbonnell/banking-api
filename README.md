Banking API Dashboard
================
[![Build Status](https://magnum.travis-ci.com/danielbonnell/banking-api.svg?token=UobkAdyZA1SqXorqM6AB&branch=master)](https://magnum.travis-ci.com/danielbonnell/banking-api)
[![Code Climate](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/badges/cfda0bb123ec6b4825eb/gpa.svg)](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/feed)
[![Test Coverage](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/badges/cfda0bb123ec6b4825eb/coverage.svg)](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/feed)
[![Coverage Status](https://coveralls.io/repos/danielbonnell/banking-api/badge.png)](https://coveralls.io/r/danielbonnell/banking-api)

This app allows a user to register an account and access a banking API, provided they have been given the credentials. The app displays a dashboard style overview of the user's accounts, the balance of each account, and a list of recent transactions. A user can click on an account to access a list of transactions for that account. Once the basic features are implemented I plan to use jQuery to streamline the UI and HighCharts.JS for account analytics. I may add other features if time allows.

## Change Log
Here is are some highlights of what I worked on each day.

#### 03/05/15
* Refactored 'user' model by moving account methods to new 'account' model
* Styled account overview
* Added new methods to 'account' model: 'all', 'account', 'transactions', 'net_worth', 'assets', and 'debts'
* Added 'accounts' controller
* Added recent transactions to accounts overview
* Added HighCharts for debt and asset balance overview
* Added test coverage for recent transactions and account balances
* Deployed to Heroku
* Made repository private until app is complete
* Refactored overview partial, moved account overview charts into separate js file
* Added 'gon' gem to pass data from users controller to account overview charts js file

#### 03/04/15
* Added spec to test if accounts with balances appear on index page when user is authenticated
* Added CSS to set width of rows to 100% of browser width and columns to 100% of browser height
* Added RestClient and JSON gems
* Eliminated ability to see other users
* Eliminated acceptance tests for ability to see other users
* Created layout for accounts index page
* Created methods to retrieve account data from API as hash
* Added API key to Travis CI as a repository setting
* Added API key to Heroku
* Deployed to Heroku

#### 03/03/15
* Set up generic Rails 4 app with Devise and Foundation using rails-omniauth generator
* Wrote initial set of user stories
* Set up test suite with user stories
* Migration to add username field to the user model
* Added code quality metrics (Coveralls, CodeClimate, Hound CI) and continuous integration testing (Travis CI)
* Initial deployment to Heroku using Puma web server
