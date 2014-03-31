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
    @house = House.find_by({user_id: current_user.id})
  end

  def edit
    @regions = Region.all
    @house = House.find_by({id: params[:id]})
  end

  def update
    @house = House.find_by({id: params[:id]})

    @house.update(house_params)

    if @house.save
      redirect_to house_path(@house)
    else
      render :edit
    end
  end

  def destroy
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
