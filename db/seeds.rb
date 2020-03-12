# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
9.times do |i|
    Recipe.create(
      name: "Recipe #{i + 1}",
      ingredients: '227g tub clotted cream, 25g butter, 1 tsp cornflour,100g parmesan, grated nutmeg, 250g fresh fettuccine or tagliatelle, snipped chives or chopped parsley to serve (optional)',
      instruction: 'In a medium saucepan, stir the clotted cream, butter, and cornflour over a low-ish heat and bring to a low simmer. Turn off the heat and keep warm.'
    )
end

20.times do |i|
  User.create(
    email: Faker::Internet.email,
    password: 123456,
    password_confirmation: 123456
  )
end

trip_names = ["Romantic Spots for Honeymoons", 
                "Top Island Getaways", 
                "Most Romantic Destinations", 
                "Top Spots for Skiing" ]
                
trip_names.each do |trip_name|
  Trip.create(name: trip_name)
end
