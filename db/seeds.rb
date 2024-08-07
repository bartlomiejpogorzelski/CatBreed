# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Photo.create(image: File.open('/docker/app/public/uploads/cat1.png'))
# wget -O /docker/app/public/uploads/cat1.png https://raw.githubusercontent.com/bartlomiejpogorzelski/CatBreed/master/app/assets/images/cat1.png
# Staging:     photos: [Photo.new(image: Rack::Test::UploadedFile.new("/docker/app/public/uploads/cat1.png"))],
puts "Seeding cats..."
statuses = [:available, :reserved, :reservation_reported, :sold]

10.times do |i|
  cat_status = statuses.sample
  cat = Cat.new(
    name: Faker::Creature::Cat.name,
    breed: Cat::BREEDS.sample,
    # color: Faker::Creature::Cat.color,
    date_of_birth: Faker::Date.birthday(min_age: 1, max_age: 15),
    gender: ['Male', 'Female'].sample,
    description: Faker::Lorem.paragraph,
    photos: [Photo.new(image: Rack::Test::UploadedFile.new("app/assets/images/cat1.png"))],
    pedigree_information: Faker::Lorem.sentence,
    price: Faker::Commerce.price(range: 50..500.0, as_string: true),
    status: cat_status,
    vaccination_information: Faker::Lorem.sentence,
    health_status: ['Healthy', 'Sick', 'Under Treatment'].sample,
    owner_information: Faker::Name.name,
    location: Faker::Address.city,
    neutered: [true, false].sample,
    notes: Faker::Lorem.paragraph,
    is_parent: [true, false].sample
    # videos: 'kitten_video.mp4'
  )

  if cat.save
    puts "Cat #{i + 1} created: #{cat.name}, #{cat.breed}, #{cat.status}"

    if [:reserved, :reservation_reported, :sold].include?(cat_status)
      deposit_paid = [:reserved, :sold].include?(cat_status) ? true : false
      reservation = Reservation.new(
        cat: cat,
        start_date: Faker::Date.backward(days: 30),
        end_date: Faker::Date.forward(days: 30),
        deposit_paid: deposit_paid
      )

      if reservation.save
        puts "Reservation created for Cat #{i + 1}"
      else
        puts "Error creating reservation for Cat #{i + 1}: #{reservation.errors.full_messages.join(", ")}"
      end
    end
  else
    puts "Error creating cat #{i + 1}: #{cat.errors.full_messages.join(", ")}"
  end
end
puts "Cats seeding completed."

puts "Seeding users..."
unless User.exists?(email: "user@example.com")
  User.create!(email: "user@example.com", password: "123456", password_confirmation: "123456")
  puts "User with email user@example.com created."
else
  puts "User with email user@example.com already exists."
end

unless User.exists?(email: "admin@example.com")
  User.create!(email: "admin@example.com", password: "123456", password_confirmation: "123456", role: 1)
  puts "Admin with email admin@example.com created."
else
  puts "Admin with email admin@example.com already exists."
end

puts "Seeding posts..."
posts = [
  { title: 'Pierwszy wpis', content: 'Treść pierwszego wpisu na blogu.', user: User.first },
  { title: 'Drugi wpis', content: 'Treść drugiego wpisu na blogu.', user: User.first },
  { title: 'Trzeci wpis', content: 'Treść trzeciego wpisu na blogu.', user: User.first }
]

posts.each_with_index do |post, index|
  if Post.create(post)
    puts "Post #{index + 1} created: #{post[:title]}"
  else
    puts "Error creating post #{index + 1}"
  end
end
puts "Posts seeding completed."
