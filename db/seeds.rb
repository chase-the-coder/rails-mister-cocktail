require 'open-uri'
require 'json'
Ingredient.destroy_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding started...."
array = ("a".."z").to_a
array.each do |letter|
  response = open("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{letter}")
  json = JSON.parse(response.read)
  json["drinks"].each do |drink|
    drink_hash = { name:  drink["strDrink"], instructions: drink["strInstructions"],
                   thumbnail: drink["strDrinkThumb"] }
    array = (1..15).to_a
    array.each do |number|
      unless drink["strIngredient#{number}"].nil?
        drink_hash["strIngredient#{number}"] = drink["strIngredient#{number}"]
        drink_hash["strMeasure#{number}"] = drink["strMeasure#{number}"]
        Ingredient.create(name: drink["strIngredient#{number}"])
      end
    end
    Cocktail.create(drink_hash)
  end
end


# 25.times do
#   response = open("https://www.thecocktaildb.com/api/json/v1/1/random.php")
#   json = JSON.parse(response.read)
#   Cocktail.create(name: json["drinks"][0]["strDrink"], instructions: json["drinks"][0]["strInstructions"])
# end


# Cocktail.create(name: "Rum & Coke")
# response = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
# json = JSON.parse(response.read)
# json["drinks"].each do |ingredient|
#   Ingredient.create(name: ingredient["strIngredient1"])
# end
puts "Seeding complete!"
