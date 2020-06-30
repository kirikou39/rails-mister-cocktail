# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeding Ingredients
require 'json'
require 'open-uri'

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

serialized_ingredients = open(url).read
ingredients = JSON.parse(serialized_ingredients)
# p ingredients

p "Cleaning the ingredients database"
if Rails.env.development?
  p "Rails is in development environment"
  Ingredient.destroy_all 
end
p "Seeding..."
i = 0
100.times do
  ingredient = Ingredient.create(
    name: ingredients["drinks"][i]["strIngredient1"]
    )
  p "Ingredient: #{ingredient.name} is created"
  i += 1
end

p "Done seeding!"
# Seeding ...