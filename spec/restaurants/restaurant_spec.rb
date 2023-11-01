# spec/models/restaurant_spec.rb
require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe '.cuisine' do
    it 'returns restaurants with matching rating and cuisine' do
      restaurant1 = Restaurant.create(rating: 4, cuisine: 'Hot Spicy')
      restaurant2 = Restaurant.create(rating: 3, cuisine: 'Vege')
      restaurant3 = Restaurant.create(rating: 5, cuisine: 'Not Spicy')

      restaurants = Restaurant.cuisine(4, ['Hot Spicy'])
      expect(restaurants).to include(restaurant1)
    end

    it 'returns an empty array when no matching restaurants' do
      restaurant1 = Restaurant.create(rating: 4, cuisine: 'Hot Spicy')
      restaurant2 = Restaurant.create(rating: 3, cuisine: 'Vege')

      restaurants = Restaurant.cuisine(4, ['Not Spicy'])
      expect(restaurants).to be_empty
    end

    it 'returns restaurants with matching rating and multiple cuisines' do
      restaurant1 = Restaurant.create(rating: 4, cuisine: 'Hot Spicy')
      restaurant2 = Restaurant.create(rating: 3, cuisine: 'Vege')
      restaurant3 = Restaurant.create(rating: 5, cuisine: 'Not Spicy')

      restaurants = Restaurant.cuisine(3, ['Vege', 'Not Spicy'])
      expect(restaurants).to include(restaurant2, restaurant3)
    end

    it 'returns an empty array when no matching restaurants with multiple cuisines' do
      restaurant1 = Restaurant.create(rating: 4, cuisine: 'Hot Spicy')
      restaurant2 = Restaurant.create(rating: 3, cuisine: 'Vege')
      restaurant3 = Restaurant.create(rating: 5, cuisine: 'Not Spicy')

      restaurants = Restaurant.cuisine(5, ['Hot Spicy', 'Vege'])
      expect(restaurants).to be_empty
    end
  end
end



