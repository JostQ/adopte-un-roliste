class AdventureController < ApplicationController
  def create_and_research

    @session = GameSession.new
    @game_sessions_cities = Array.new
    GameSession.where(end_game: false).each do |game_session|
      @game_sessions_cities << game_session.city
    end
    @roleplay = Roleplay.all
  end
  def create
    character = Character.find(params["character"])
    character.game_session_id = params["game_session"]
    character.save
    redirect_to "/adventure/#{params["game_session"]}", flash: {validate: 'Votre personnage est enregistré'}
  end
  def show
    if user_signed_in?
      @user = User.find(current_user.id)
      @new_charac = Role.new
    end
    @game = GameSession.find(params[:id])
    @characters = @game.characters
    @gm = Role.find_by(game_session: @game, game_master: "true").user
  end
end
