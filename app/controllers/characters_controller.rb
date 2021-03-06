class CharactersController < ApplicationController
  before_action :user_signed_in?

  def new
    @character = Character.new
    @game_sessions = Array.new
    current_user.game_sessions.each do |game_session|
      if current_user.roles.find_by(game_session: game_session, game_master: "f")
        unless current_user.characters.find_by(game_session: game_session)
          @game_sessions << game_session
        end
      end
    end
    @roleplays = Roleplay.all
  end

  def show
    if params[:id]
      if Character.find(params[:id])
        @character = Character.find(params[:id])
      end
    end
  end

  def create

    error = Hash.new

    character = Character.new
    character_info = params[:character]

    character.pseudo = character_info["pseudo"]
    character.level = character_info["level"].to_i
    character.description = character_info["description"]
    character.roleplay = Roleplay.find(character_info[:roleplay])
    unless character_info[:game_session] === "none"
      if GameSession.find_by(id: character_info[:game_session])
        character.game_session = GameSession.find(character_info[:game_session])
      end
    end
    character.user = current_user

    if character.save
      error[:character] = "Character Error"
    end
    if params[:primnames]
      params[:primnames].each do |index, value|
        prim = PrimarySpec.new
        prim.name = value
        prim.value = params[:primvals][index].to_i
        prim.character = character
        if prim.save
          error[:prim] = "Prim Error"
        end
      end
    end

    if params[:secnames]
      params[:secnames].each do |index, value|
        sec = SecondarySpec.new
        sec.name = value
        sec.value = params[:secvals][index].to_i
        sec.character = character
        if sec.save
          error[:sec] = "Sec Error"
        end
      end
    end

    if params[:items]
      params[:items].each do |index, value|
        inventory = Inventory.new
        inventory.name = value
        inventory.character = character
        if inventory.save
          error[:item] = "Item Error"
        end
      end
    end

    if error = {}
      redirect_to "/profile/#{current_user.id}", flash: { validate: "Personnage créé !"}
    else
      p error
    end

  end

  private

  def character_params
  	params.require(:character).permit(:pseudo, :description)
  end
end
