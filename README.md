Geezeo API Dashboard
================
[![Build Status](https://travis-ci.org/danielbonnell/geezeo.svg?branch=master)](https://travis-ci.org/danielbonnell/geezeo)
[![Code Climate](https://codeclimate.com/github/danielbonnell/geezeo.png)](https://codeclimate.com/github/danielbonnell/geezeo)
[![Coverage Status](https://coveralls.io/repos/danielbonnell/geezeo/badge.png)](https://coveralls.io/r/danielbonnell/geezeo)

This app allows a user to register an account and access the Geezeo API, provided they have been given the credentials. The app displays a dashboard style overview of the user's accounts, the balance of each account, and a list of recent transactions. A user can click on an account to access a list of transactions for that account. Once the basic features are implemented I plan to use jQuery to streamline the UI and HighCharts.JS for account analytics. I may add other features if time allows.

## Change Log
Here is are some highlights of what I worked on each day.

#### 03/04/15
*

#### 03/03/15
* Set up generic Rails 4 app with Devise and Foundation using rails-omniauth generator
* Wrote initial set of user stories
* Set up test suite with user stories
* Migration to add username field to the user model
* Added code quality metrics (Coveralls, CodeClimate, Hound CI) and continuous integration testing (Travis CI)
* Initial deployment to Heroku using Puma web server
