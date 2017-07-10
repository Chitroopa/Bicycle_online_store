# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Image.destroy_all
10.times do |index|
  f = Product.create!(
        name: Faker::Lorem.characters(10),
        price: Faker::Number.decimal(2),
        size: Faker::Number.number(2),
        speed: Faker::Number.number(2),
        description: Faker::StarWars.quote
      )
  2.times do |index|
    i= Image.create!(
      product_id: f.id,
      :image => open("public/images/test.jpg")
    )
  end
end

p "Created #{Product.count} products"
p "Created #{Image.count} image"
