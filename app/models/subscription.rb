class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  # Assuming you have a 'restaurant' association in Subscription
  # Add a has_many association specifying the source
  has_many :subscribed_restaurants, through: :subscriptions, source: :restaurant
end