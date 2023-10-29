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
