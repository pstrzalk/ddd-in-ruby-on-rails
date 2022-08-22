# README

## Description

Code examples for concepts discussed in series of titled "DDD in Ruby on Rails", available at https://www.visuality.pl/posts/introduction-to-ddd-in-ruby-on-rails

## Setup

1. clone repo
2. run `bundle`
3. rub `rails db:prepare`

## Testing

This repo has no testing framework. It contains interactive tests, which can be run against your development database.

Test scripts can be run using rails runner. Example:

```sh
$ rails r test/customer/model/orm_driven.rb
```

The test are not aimed to give 100% code coverage (or in fact - no coverage at all). They are here to give you an easy entry point to the implemented concepts. Run them and adjust to see the logic in action.
