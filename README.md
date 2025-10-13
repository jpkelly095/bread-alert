# 🚨 Bread Alert 🚨

Bread spy is in the base!

## Description

Bread Alert is a simplified nutrition app, customized for diabetics, by a diabetic, to help quickly count carbs for homemade food.

## Background

### Problem

As a diabetic who frequently cooks and bakes at home, it can be cumbersome to manage the carb counting for my recipes.
I spend a lot of time in my phone's calculator trying to add up the total carbs from different ingredients, and then enjoying my food is often delayed by having to find my notes on the net weight and total carbs of the recipe,
if I even remembered to write it all down, and then calculating the total carbs in my portion based those notes.

### Solution

Bread Alert is my attempt to make this whole process a lot easier and more intuitive, by self-hosting a Rails app to:
1. Act as a one-stop shop for food and recipe carb counts (no more scattered notes or scrolling through my phone trying to find the carb counts)
2. Do all the carb counting math for me (no more calculator and user error)

## Tech Stack

- `ruby v3.4.2`
- `rails v8.0.3`
- `postgres v14.17`

## Local Development

### Prerequisites

1. Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
2. Install [Rails](https://guides.rubyonrails.org/install_ruby_on_rails.html)
3. Clone this repo
4. Run `bundle install` in the project root directory

### Running Locally

To run the app:

```sh
rails s
```

To seed the database with sample data:

```sh
rake db:seed
```

### Running with Docker

TODO
