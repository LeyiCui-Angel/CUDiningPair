class PairingsController < ApplicationController
  
  def new
    @pairing = Pairing.new
    @users = User.all
    @restaurants = Restaurant.all
    @available_pairings = Pairing.where('current_number_of_people < target_number_of_people')
  end

  def create

    create_new_pairing

  end

  def edit
    @pairing = Pairing.find(params[:id])
  end

  def index
    Pairing.all.each(&:update_current_number_of_people)
    @pairings = Pairing.all
    @joinable_pairings = Pairing.where('current_number_of_people < target_number_of_people')
  end
  

  def show
    @pairing = Pairing.find(params[:id])
  end

  def update
    @pairing = Pairing.find(params[:id])
    @pairing.update(pairing_params)
    flash[:notice] = "Pairing was successfully updated."
    redirect_to pairing_path(@pairing)
  end

  def destroy
    @pairing = Pairing.find(params[:id])
    @pairing.destroy
    flash[:notice] = "Restaurant Pairing deleted."
    redirect_to pairings_path
  end

  def join
    @pairing = Pairing.find(params[:id])
  
    # Check if the user is already associated with the pairing
  if current_user.pairings.include?(@pairing)
    flash[:notice] = "You are already part of this pairing."
  else
    # Check if the pairing is full before allowing the user to join
    if @pairing.current_number_of_people < @pairing.target_number_of_people
      current_user.pairings << @pairing
      @pairing.increment!(:current_number_of_people)

      flash[:notice] = "Successfully joined the pairing."

    end
  end
  
    redirect_to pairings_path
  end

  
  
  
  

  private

  def pairing_params
    params.require(:pairing).permit(:restaurant_id, :target_number_of_people, :existing_pairing_id, :meeting_time, user_ids: [])
  end

  def create_new_pairing
    @pairing = Pairing.new(pairing_params)

    if @pairing.save
      flash[:notice] = "Pairing created successfully."
      current_user.pairings << @pairing
      redirect_to pairings_path
    else

      render 'new'
    end
  end

  
end
