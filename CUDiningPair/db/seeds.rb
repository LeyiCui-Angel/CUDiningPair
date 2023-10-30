# db/seeds.rb
require 'faker'
require 'securerandom'

# Create a specific user who has been verified
User.create!(
    name: 'Angel Baez',
    uni: 'ab123',
    email: 'ab123@columbia.edu',
    password_digest: BCrypt::Password.create('ab123'),
    verification_code: rand.to_s[2..7],
    verified_at: Time.now
)

# Create a specific user who hasn't been verified
User.create!(
  name: 'Charlie Doe',
  uni: 'cd456',
  email: 'cd456@columbia.edu',
  password_digest: BCrypt::Password.create('cd456'),
  verification_code: rand.to_s[2..7],
  verified_at: nil  # Explicitly setting this to nil to indicate the user is not verified
)

restaurants = [
  {custom_id: 1, name: 'Restaurant A', location: '123 Main St', rating: 4.5, ratingcount: 100, cuisine: 'hot spicy' },
  {custom_id: 2, name: 'Restaurant B', location: '456 Elm St', rating: 3.8, ratingcount: 11 , cuisine: 'vege'},
  {custom_id: 3, name: 'Restaurant C', location: '789 Oak St', rating: 4.2,ratingcount: 45 , cuisine: 'not spicy'}
  # Add more restaurants as needed
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end