class RestaurantsController < ApplicationController

    def show
      id = params[:id] # Retrieve restaurant ID from URI route
      @restaurant = Restaurant.find(id) # Look up restaurant by unique ID
      @reviews = @restaurant.reviews
      # Will render app/views/restaurants/show.<extension> by default
    end
  
    
    def index

      selected_rating = params[:rating]
      selected_cuisine = params[:cuisine]

      #check if selected cuisine
      if params[:cuisine]
        @cuisine_to_show=params[:cuisine].keys
      else
        @cuisine_to_show=['Hot spicy','vege','not spicy']
      end
      # if params[:cuisine]
      #   @cuisine_to_show = params[:cuisine].is_a?(Hash) ? params[:cuisine].keys : [params[:cuisine]]
      # else
      #   @cuisine_to_show = ['Hot spicy', 'vege', 'not spicy']
      # end

      #check if selected rating
      if params[:rating]
        @rating_to_show=params[:rating]       
      else
        @rating_to_show='Any'
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
      
      if @rating_to_show =~ /\A\d+(\.\d+)?\z/
        @restaurants = Restaurant.cuisine(@rating_to_show, @cuisine_to_show)
      else
        @restaurants = Restaurant.cuisine(1, @cuisine_to_show)
      end

      if current_user
        @restaurants.each do |restaurant|
          restaurant.subscribed = restaurant.subscribed_by_user?(current_user)
        end
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

    def create_review
        @restaurant = Restaurant.find(params[:id])
        @review = @restaurant.reviews.create(review_params)
    
        if @review.save
          flash[:notice] = 'Review was successfully created.'
          update_restaurant_rating
        else
          flash[:alert] = 'Error creating review.'
        end
    
        redirect_to restaurant_path(@restaurant)
      end

      def subscribe
        @restaurant = Restaurant.find(params[:id])
    
        if current_user.subscribed_restaurants.include?(@restaurant)
          current_user.subscribed_restaurants.delete(@restaurant)
        else
          current_user.subscribed_restaurants << @restaurant
        end
    
        # No need for respond_to, Rails will automatically choose the correct format
      end
  
    private
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :rating, :cuisine, :subscribed.to_s)
    end

    def review_params
        params.require(:review).permit(:user_name, :rating, :comment)
    end

    def update_restaurant_rating
        total_rating = @restaurant.reviews.sum(:rating)
        num_reviews = @restaurant.reviews.count
    
        new_average_rating = num_reviews.zero? ? 0 : total_rating.to_f / num_reviews
    
        @restaurant.update_attribute(:rating, new_average_rating)
    end
  end
  
