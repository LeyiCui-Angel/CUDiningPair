class RestaurantsController < ApplicationController

    def show
      id = params[:id] # Retrieve restaurant ID from URI route
      @restaurant = Restaurant.find(id) # Look up restaurant by unique ID
      # Will render app/views/restaurants/show.<extension> by default
    end
  
    def index

      selected_rating = params[:rating]
      selected_cuisine = params[:cuisine]
      if selected_cuisine.present?
        @cuisine_to_show=selected_cuisine.keys
      else
        @cuisine_to_show=[]
      end
      if params[:commit]
        session[:cuisine]=@cuisine_to_show
      else
        @cuisine_to_show=session[:cuisine]
      end
      # Initialize @restaurants with all restaurants
      @restaurants = Restaurant.all

      if selected_rating.present? && selected_cuisine.present?
        @restaurants = Restaurant.cuisine(selected_rating, @cuisine_to_show)
      elsif selected_rating.present?
        @restaurants = Restaurant.where("rating >= ?", selected_rating)
      elsif selected_cuisine.present?
        @restaurants = Restaurant.cuisine(0, @cuisine_to_show)
      end
    end
  
    def new
      # Default: render 'new' template
    end
  
    def create
      @restaurant = Restaurant.create!(restaurant_params)
      flash[:notice] = "#{@restaurant.name} was successfully created."
      redirect_to restaurants_path
    end
  
    def edit
      @restaurant = Restaurant.find(params[:id])
    end
  
    def update
      @restaurant = Restaurant.find(params[:id])
      @restaurant.update(restaurant_params)
      flash[:notice] = "#{@restaurant.name} was successfully updated."
      redirect_to restaurant_path(@restaurant)
    end
  
    def destroy
      @restaurant = Restaurant.find(params[:id])
      @restaurant.destroy
      flash[:notice] = "Restaurant '#{@restaurant.name}' deleted."
      redirect_to restaurants_path
    end
  
    private
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :rating, :cuisine)
    end
  end
  