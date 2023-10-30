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

# spec/controllers/restaurants_controller_spec.rb
require 'rails_helper'

RSpec.describe RestaurantsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end

    # Existing tests for the "index" action

    it "displays the cuisine filter options" do
      # Add a test to check if the cuisine filter options are displayed correctly
      get :index
      expect(response.body).to include("Hot Spicy")
      expect(response.body).to include("Vege")
      expect(response.body).to include("Not Spicy")
    end
  end

  describe "POST #create" do
    it "creates a new restaurant with cuisine" do
      # Add a test to check if a new restaurant with cuisine is created successfully
      post :create, params: { restaurant: { name: "New Restaurant", location: "New Location", rating: 4, cuisine: "Hot Spicy" } }
      expect(Restaurant.last.cuisine).to eq("Hot Spicy")
    end

    # Existing tests for the "create" action
  end
end

