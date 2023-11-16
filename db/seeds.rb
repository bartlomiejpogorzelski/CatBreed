# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Cat.create(
    name: Faker::Creature::Cat.name,
    breed: Faker::Creature::Cat.breed,
    # color: Faker::Creature::Cat.color,
    date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 15),
    gender: ['Male', 'Female'].sample,
    description: Faker::Lorem.paragraph,
    photos: [Photo.new(image: Rack::Test::UploadedFile.new("app/assets/images/cat1.png"))], 
    pedigree_information: Faker::Lorem.sentence,
    price: Faker::Commerce.price(range: 50..500.0, as_string: true),
    status: ['Available', 'Reserved', 'Sold'].sample,
    vaccination_information: Faker::Lorem.sentence,
    health_status: ['Healthy', 'Sick', 'Under Treatment'].sample,
    owner_information: Faker::Name.name,
    location: Faker::Address.city,
    neutered: [true, false].sample,
    notes: Faker::Lorem.paragraph,
    is_parent: [true, false].sample
    # videos: 'kitten_video.mp4' 
  )
end
unless User.exists?(email: "user@example.com")
  User.create!(email: "user@example.com", password: "123456", password_confirmation: "123456")  
end
unless User.exists?(email: "admin@example.com")  
  User.create!(email: "admin@example.com", password: "123456", password_confirmation: "123456", role: 1)
end

posts = [
  { title: 'Pierwszy ', content: 'Ttreść pierwszego wpisu na blogu.' },
  { title: 'Drugi wpis', content: 'Treść drugiego wpisu na blogu.' },
  { title: 'Trzeci wpis', content: 'Treść trzeciego wpisu na blogu.' }
]

posts.each { |post| Post.create(post) }