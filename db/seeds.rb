# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

  Cocktail.destroy_all
  Ingredient.destroy_all
  Dose.destroy_all

  50.times do
    ingredient = Ingredient.create(
      name: Faker::Hipster.words(3).join(' ').capitalize
    )
  end
  puts "ingredients créés !"

  50.times do
    cocktail = Cocktail.create(
      name: Faker::Beer.name
    )
  end
  puts "cocktails créés !"

  frigo = Ingredient.all
  bar = Cocktail.all
  puts "frigo & bar créés !"

  100.times do
    dose = Dose.new(
      description: "#{rand(2..4)} #{['cc','dc','drops'].sample} of #{Faker::Lorem.word}",
      )
    dose.ingredient = frigo.sample
    dose.cocktail = bar.sample
    dose.save
  end
  puts "doses créées !"


