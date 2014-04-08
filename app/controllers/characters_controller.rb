class CharactersController < ApplicationController

  def index
    @characters = current_user.characters
  end

  def new
    # loads the current user's houses to make them available
    # in the drop down
    @houses = current_user.houses
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

  def show
    @character = Character.find_by(id: params[:id])
    session[:char_id] = @character.id
  end

  def edit
    # loads the current user's houses to make them available
    # in the drop down
    @houses = current_user.houses
    @character = Character.find_by(id: params[:id])
  end

  def destroy
    character = Character.find_by({id: params[:id]})
    character.delete
    redirect_to("/characters")
  end

  # pending a conversation with Phil, still not working
  def oauth

    verification_code = params[:code]
    token_result = HTTParty.post("https://accounts.google.com/o/oauth2/token", :body => {:code => verification_code, :grant_type => "authorization_code"})
    binding.pry
    redirect_to("/characters/#{session[:char_id]}")
  end


# this allows users to export the current character
# to their Google Drive via OAuth
# OAuth2:  https://github.com/intridea/oauth2
# Google Drive Ruby Gem:  https://github.com/gimite/google-drive-ruby

# eventually should move this to the characters model
# or perhaps another model entirely, as we're going to
# want to be able to do this with houses too
def export
  @character = Character.find_by(id: params[:id])

  #creates client per instructions at:
  # http://gimite.net/doc/google-drive-ruby/GoogleDrive.html#method-c-login_with_oauth

  # client = OAuth2::Client.new(
  #   ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
  #   :site => "https://accounts.google.com",
  #   :token_url => "/o/oauth2/token",
  #   :authorize_url => "/o/oauth2/auth")
  # auth_url = client.auth_code.authorize_url(
  #   :redirect_uri => "http://127.0.0.1:3000/oauth",
  #       :scope =>
  #       "https://docs.google.com/feeds/ " +
  #       "https://docs.googleusercontent.com/")
  # binding.pry

  # # gets authorization code from Google
  # auth_code = params[:authenticity_token]
  # # removes the = from the end of the code
  # auth_code.slice!("=")

  # # should get the authorization token
  # auth_token = client.auth_code.get_token(
  #   auth_code, :redirect_uri => "http://127.0.0.1:3000/oauth")



  # create a session of Google Drive where it uses OAuth2
  drive_session = GoogleDrive.login_with_oauth(auth_token.token)

  # input a variable for naming the sheet
  # probably call it the character's name
  drive_session.create_spreadsheet("main_test")

  session_spreadsheet = drive_session.spreadsheet_by_title("main_test")

  session_worksheet = session_spreadsheet.worksheets[0]

  session_worksheet[1,1] = Time.now
  session_worksheet[2,1] = "Owner:"
  session_worksheet[2,2] = current_user.name

  session_worksheet[4,1] = "Name:"
  session_worksheet[4,2] = @character.name
  session_worksheet[4,3] = "Age:"
  session_worksheet[4,4] = @character.age
  session_worksheet[4,5] = "Gender:"
  session_worksheet[4,6] = @character.gender
  session_worksheet[4,7] = "House:"
  session_worksheet[4,8] = @character.house.name
  session_worksheet[6,1] = "Agility:"
  session_worksheet[6,2] = @character.agility
  session_worksheet[7,1] = "Animal Handling:"
  session_worksheet[7,2] = @character.animal_handling
  session_worksheet[8,1] = "Athletics:"
  session_worksheet[8,2] = @character.athletics
  session_worksheet[9,1] = "Awareness:"
  session_worksheet[9,2] = @character.awareness
  session_worksheet[10,1] = "Cunning:"
  session_worksheet[10,2] = @character.cunning
  session_worksheet[11,1] = "Deception:"
  session_worksheet[11,2] = @character.deception
  session_worksheet[12,1] = "Endurance:"
  session_worksheet[12,2] = @character.endurance
  session_worksheet[13,1] = "Fighting:"
  session_worksheet[13,2] = @character.fighting
  session_worksheet[14,1] = "Healing:"
  session_worksheet[14,2] = @character.healing
  session_worksheet[15,1] = "Language:"
  session_worksheet[15,2] = @character.language
  session_worksheet[6,4] = "Knowledge:"
  session_worksheet[6,5] = @character.knowledge
  session_worksheet[7,4] = "Marksmanship:"
  session_worksheet[7,5] = @character.marksmanship
  session_worksheet[8,4] = "Persuasion:"
  session_worksheet[8,5] = @character.persuasion
  session_worksheet[9,4] = "Status:"
  session_worksheet[9,5] = @character.status
  session_worksheet[10,4] = "Stealth:"
  session_worksheet[10,5] = @character.stealth
  session_worksheet[11,4] = "Survival:"
  session_worksheet[11,5] = @character.survival
  session_worksheet[12,4] = "Thievery:"
  session_worksheet[12,5] = @character.thievery
  session_worksheet[13,4] = "Warfare:"
  session_worksheet[13,5] = @character.warfare
  session_worksheet[14,4] = "Will:"
  session_worksheet[14,5] = @character.will

  if session_worksheet.save
    redirect_to("/characters")
  else
    puts "error error error"
  end

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
