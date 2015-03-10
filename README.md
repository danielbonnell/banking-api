Banking API Dashboard
================
[![Build Status](https://magnum.travis-ci.com/danielbonnell/banking-api.svg?token=UobkAdyZA1SqXorqM6AB&branch=master)](https://magnum.travis-ci.com/danielbonnell/banking-api)
[![Code Climate](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/badges/cfda0bb123ec6b4825eb/gpa.svg)](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/feed)
[![Test Coverage](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/badges/cfda0bb123ec6b4825eb/coverage.svg)](https://codeclimate.com/repos/54f91bc5e30ba075e2000199/feed)

This app allows a user to register an account and access a banking API, provided they have been given the credentials. The app displays a dashboard style overview of the user's accounts, the balance of each account, and a list of recent transactions. A user can click on an account to access a list of transactions for that account. A breakdown of assets and debts is presented using HighCharts.JS.

## Overview
The first page a user sees upon authenticating. It displays an overview of total assets and debts by account using HighCharts.JS. The accordion view allows a user to switch from their net worth overview, a list of their ten most recent transactions, and a list of accounts grouped by type (e.g. credit cards, cash accounts, etc.)
![Banking-API](https://github.com/danielbonnell/banking-api/blob/master/overview.png)
![Banking-API](https://github.com/danielbonnell/banking-api/blob/master/transactions.png)
![Banking-API](https://github.com/danielbonnell/banking-api/blob/master/accounts.png)

A user can click on an account to view the balance of that account along with a list of recent transactions associated with that account.
![Banking-API](https://github.com/danielbonnell/banking-api/blob/master/account.png)

## Change Log
Here is are some highlights of what I worked on each day.

#### 03/11/15
* Update README with screenshots of app
* Added unit tests for all user and account methods
* Deployed latest build to Heroku

#### 03/10/15
* Refactored user and account models to make them more semantic and DRY
* Refactored users and accounts controller to make them more semantic and DRY
* Refactored accounts overview and account view, moved transactions into a shared partial to DRY up the code
* Dropped Coveralls in favor of Code Climate for test coverage

#### 03/09/15
* Added validation that checks if username is registered with the API
* Fixed bugs causing the Travis CI build not to run the database migrations before running the test suite
* Updated user registration test to check for username
* Commented out test for transactions until I can figure out how to pass the data from the controller to the spec. The test fails at random because the transaction data is not always the same between API calls.

#### 03/06/15
* Refactored account model

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
