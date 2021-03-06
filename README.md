# Flowspace Bakery

Flowspace Bakery is an artisanal digital bakery, crafting the finest digital cookies in New York City.

We don't mass produce our cookies in faceless factories. Instead, We bake cookies to order, one at a time.

## Run Locally

- Make sure you run sidekiq using the configuration at `/config/sidekiq.yml` this way:

`bundle exec sidekiq -C ./config/sidekiq.yml`

- Make sure you have your Redis adapter configured properly as well so ActionCable run correctly.

## Reference Application

A reference application can be found at [http://flowspace-bakery.herokuapp.com](http://flowspace-bakery.herokuapp.com)

HTTP Auth access: bake / somecookies

## Test Suite

Like most bakeries, Flowspace Bakery has a test suite. The full suite can be run with:

`$ rspec spec`

## Requirements

This application requires:

- Ruby 2.6.2
- PostgreSQL server running on localhost

## Similar Projects

[Momofuku milk bar](http://milkbarstore.com/)
