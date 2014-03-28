class CharactersController < ApplicationController

  def new
    @houses = House.all
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
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
      :is_alive
      )
  end

end
