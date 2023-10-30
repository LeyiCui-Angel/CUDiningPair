class RestaurantsController < ApplicationController

    def show
      id = params[:id] # Retrieve restaurant ID from URI route
      @restaurant = Restaurant.find(id) # Look up restaurant by unique ID
      # Will render app/views/restaurants/show.<extension> by default
    end
  
    def index

      selected_rating = params[:rating]
      selected_cuisine = params[:cuisine]

      #check if selected cuisine
      if params[:cuisine]
        @cuisine_to_show=params[:cuisine].keys
      else
        @cuisine_to_show=[]
      end

      #check if selected rating
      if params[:rating]
        @rating_to_show=params[:rating]
      else
        @rating_to_show=0
      end

      #check if pressed button or back from other pages
      if params[:commit]
        session[:cuisine]=@cuisine_to_show
        session[:rating]=@rating_to_show
      else
        if session[:cuisine]
          @cuisine_to_show=session[:cuisine]
        end
        if session[:rating]
          @rating_to_show=session[:rating]
        end
      end

      @restaurants = Restaurant.cuisine(@rating_to_show, @cuisine_to_show)

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
  