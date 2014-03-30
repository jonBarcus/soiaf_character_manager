class CharactersController < ApplicationController

  def index
    @characters = current_user.characters
  end

  def new
    @houses = House.all
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to("/")
    else
      render("/characters/new")
    end
  end

  def destroy
    character = Character.find_by({id: params[:id]})
    character.delete
    redirect_to("/characters")
  end


  private

  def character_params
    params.require(:character).permit(
      :name,
      :age,
      :gender,
      :house_id,
      :agility,
      :animial_handling,
      :athletics,
      :awareness,
      :cunning,
      :deception,
      :endurance,
      :fighting,
      :healing,
      :language,
      :knowledge,
      :marksmanship,
      :persuasion,
      :status,
      :stealth,
      :survival,
      :thievery,
      :warfare,
      :will,
      :is_alive,
      :user_id
      )
  end

end
