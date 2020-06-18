# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



MealCategory.create(description: "dinner")
MealCategory.create(description: "lunch")
MealCategory.create(description: "breakfast")
MealCategory.create(description: "supper")
MealCategory.create(description: "teabreak")
MealCategory.create(description: "snack")
MealCategory.create(description: "dessert")

WorkoutCategory.create(description:"Chest")
WorkoutCategory.create(description:"Arm")
WorkoutCategory.create(description:"Legs")
WorkoutCategory.create(description:"Back")
WorkoutCategory.create(description:"Shoulder")
WorkoutCategory.create(description:"Core")