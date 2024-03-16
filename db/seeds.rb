# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

OrderItem.destroy_all
Order.destroy_all
CartItem.destroy_all
Cart.destroy_all
Item.destroy_all
User.destroy_all


#création de 20 items
20.times do
  Item.create(title: Faker::Lorem.sentence(word_count: 4), description: Faker::Lorem.sentence(word_count: 40), price: rand(10..50), image_url: "https://media.istockphoto.com/id/508030340/fr/photo/sunny-chat.jpg?s=2048x2048&w=is&k=20&c=Pwg60DIr0iYbQLwDXCHfdhfUgRKq7UdQsq6bfyAIaGA=")
end

#création de 4 admins
admin_emails = ['damiengeneret@outlook.com', 'toto@gmail.com', 'scherer.alexia@gmail.com', 'ra.marcarini@gmail.com']
admin_emails.each do |email|
  password = "admin123"
  password_confirmation = password
  user = User.new(email: email, password: password, password_confirmation: password_confirmation, admin: true)
  user.save!
end

#création de 10 users
10.times do
  password = "admin123"
  password_confirmation = password
  user = User.new(email: Faker::Internet.email, password: password, password_confirmation: password_confirmation, admin: false)
  user.save!
end

#création d'un cart pour chaque user
User.all.each do |user|
  Cart.create(user: user, price: 0)
end

#création de 10 cart items
# 10.times do
#   item = Item.all.sample
#   cart = Cart.all.sample
#   cart_item = CartItem.create(cart: cart, item: item, price: item.price)
#   Cart.find(cart.id).update(price: cart.price + cart_item.price)
# end

#création de 10 orders
# 10.times do 
#   cart = Cart.all.sample
#   cart_items = CartItem.where(cart: cart)

#   #CREATION OF ORDER ( it's a cart already paid)
#   order = Order.create(user: cart.user, price: cart.price)
#   Cart.update(user: cart.user, price: 0)
#   CartItem.delete_by(cart_id: cart)

#   # CREATION OF ORDER_ITEMS ( History of all orders with link Items)
#   cart_items.each do |cart_item|
#     OrderItem.create(item: cart_item.item, order: order, price: cart_item.price)
#   end
# end