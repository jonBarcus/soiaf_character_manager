class HousesController < ApplicationController

  def index
    @houses = current_user.houses
  end

  def new
    @regions = Region.all
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      redirect_to("/")
    else
      render("/houses/new")
    end
  end

  def show
    @houses = House.find_by({user_id: current_user.id})
    binding.pry
  end

  def destroy
    binding.pry
    house = House.find_by({id: params[:id]})
    house.delete
    redirect_to("/houses")
  end


  private

  def house_params
    params.require(:house).permit(
      :region_id,
      :name,
      :user_id
      )
  end

end
