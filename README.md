Continious Integration: Coveralls & Semaphore
[![Coverage Status](https://coveralls.io/repos/github/Saralundkvist86/planningPoker_api/badge.svg)](https://coveralls.io/github/Saralundkvist86/planningPoker_api)
[![Build Status](https://semaphoreci.com/api/v1/saralundkvist86/planningpoker_api/branches/api_can_provide_polls_categorized/badge.svg)](https://semaphoreci.com/saralundkvist86/planningpoker_api)
Continious deployment is preformed using Heroku

# Planning Poker API

## The server
This Ruby on Rails server hosts [Planning Poker client](https://github.com/Saralundkvist86/planningPoker_client)

#### Setup
To use this server, fork this repository to your own GitHub account and clone it to your local workspace.

Install all of the dependencies:

``` $ bundle ```

Create and migrate local database :

``` $ Rails db:create db:migrate ```

Seed local database :
``` $ Rails db:seed ```

Run all test suites

``` $ rspec ```
