# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Item.destroy_all
User.destroy_all

#créaion de 10 items
20.times do
  Item.create(title: Faker::Lorem.sentence(word_count: 4), description: Faker::Lorem.sentence(word_count: 40), price: rand(10..50), image_url: "https://media.istockphoto.com/id/508030340/fr/photo/sunny-chat.jpg?s=2048x2048&w=is&k=20&c=Pwg60DIr0iYbQLwDXCHfdhfUgRKq7UdQsq6bfyAIaGA=")
end

10.times do
  User.create(email: Faker::Internet.email, password: Faker::Lorem.word)
end