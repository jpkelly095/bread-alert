# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Foods
flour = Food.create(name: "Flour", serving_size: 30, carbs_per_serving: 23)
sugar = Food.create(name: "Sugar", serving_size: 1, carbs_per_serving: 1)
apple = Food.create(name: "Apple", serving_size: 154, carbs_per_serving: 22)
juice = Food.create(name: "Apple Juice", serving_size: 240, carbs_per_serving: 35)
pb = Food.create(name: "Peanut Butter", serving_size: 32, carbs_per_serving: 8)
cs = Food.create(name: "Corn Starch", serving_size: 8, carbs_per_serving: 7)
white_rice = Food.create(name: "White Rice", serving_size: 120, carbs_per_serving: 48, notes: "Extended 2u bolus over 2 hours")

# Containers
pie_dish = Container.create(name: "Pyrex Pie Dish", weight: 910)

# Recipes
bagels = Recipe.create(name: "Bagel", serving_size: 1563)
bagels.ingredients.create(food: flour, quantity: 1000)
bagels.ingredients.create(food: sugar, quantity: 46)

apple_pie = Recipe.create(name: "Apple Pie", serving_size: 950)
apple_pie.ingredients.create(food: flour, quantity: 314)
apple_pie.ingredients.create(food: sugar, quantity: 150)
apple_pie.ingredients.create(food: apple, quantity: 964)
apple_pie.ingredients.create(food: cs, quantity: 14)
apple_pie.ingredients.create(food: juice, quantity: 80)

# Add the pie dish to the apple pie recipe
apple_pie.container = pie_dish
apple_pie.save

# Meals
breakfast = Meal.create()
breakfast.meal_items.create(item: bagels, quantity: 99)

lunch = Meal.create()
lunch.meal_items.create(item: white_rice, quantity: 121)
lunch.meal_items.create(item: apple, quantity: 140)
lunch.meal_items.create(item: pb, quantity: 25)
