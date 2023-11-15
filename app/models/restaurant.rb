class Restaurant < ActiveRecord::Base
  has_many :pairings
    
    def self.cuisine(rating, cuisine_list)
        restaurants=[]
        cuisine_list.each {|cuisine|
        restaurants.concat(Restaurant.where("rating >= ? AND LOWER(cuisine) = ?", rating, cuisine.downcase))}
      return restaurants
    end
  end
  
