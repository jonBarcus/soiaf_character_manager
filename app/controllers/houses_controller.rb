class HousesController < ApplicationController

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


  private

  def house_params
    params.require(:house).permit(
      :region_id,
      :name
      )
  end

end
