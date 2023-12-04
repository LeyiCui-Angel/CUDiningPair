# db/seeds.rb
require 'faker'
require 'securerandom'

# Create a specific user who has been verified
user1=User.create!(
    name: 'Angel Baez',
    uni: 'ab123',
    email: 'ab123@columbia.edu',
    password: 'ab123',
    password_confirmation: 'ab123',
    password_digest: BCrypt::Password.create('ab123'),
    verification_code: rand.to_s[2..7],
    verified_at: Time.now
)

# Create a specific user who hasn't been verified
user2=User.create!(
  name: 'Charlie Doe',
  uni: 'cd456',
  email: 'cd456@columbia.edu',
  password: 'cd456',
  password_confirmation: 'cd456',
  password_digest: BCrypt::Password.create('cd456'),
  verification_code: rand.to_s[2..7],
  verified_at: nil  # Explicitly setting this to nil to indicate the user is not verified
)

restaurants = [
  {custom_id: 1, name: 'Happy Hot Hunan', location: '969 Amsterdam Ave', rating: 4.5, ratingcount: 100, cuisine: 'hot spicy' },
  {custom_id: 2, name: 'VeganHood', location: '2100 Frederick Douglass Blvd', rating: 3.8, ratingcount: 11 , cuisine: 'vege'},
  {custom_id: 3, name: 'Shake Shack', location: '2957 Broadway', rating: 4.2,ratingcount: 45 , cuisine: 'not spicy'}
  # Add more restaurants as needed
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end
restaurant1 = Restaurant.create(custom_id: 4, name: 'Sweetgreen', location: '2937 Broadway', rating: 4.0,ratingcount: 45 , cuisine: 'not spicy')
restaurant2 = Restaurant.create(custom_id: 5, name: 'Bánh', location: '942 Amsterdam Ave', rating: 4.6,ratingcount: 45 , cuisine: 'not spicy')

pairing1 = Pairing.create(restaurant: restaurant1, target_number_of_people: 5, current_number_of_people: 2, users: [user1, user2],meeting_time: DateTime.new(2023, 11, 14, 12, 0, 0))
pairing2 = Pairing.create(restaurant: restaurant2, target_number_of_people: 4, current_number_of_people: 1, users: [user1], meeting_time: DateTime.new(2023, 11, 15, 14, 30, 0))
