class Restaurant < ActiveRecord::Base
  has_many :pairings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user
  attr_accessor :subscribed # Add this line
  def subscribed_by_user?(user)
    subscribers.exists?(user.id)
  end
    def self.cuisine(rating, cuisine_list)
        restaurants=[]
        cuisine_list.each {|cuisine|
        restaurants.concat(Restaurant.where("rating >= ? AND LOWER(cuisine) = ?", rating, cuisine.downcase))}
      return restaurants
    end
  end
  
