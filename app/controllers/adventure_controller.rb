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
    role = Role.new
    role.user = current_user
    role.game_session_id = params[:game_session]
    role.save

    redirect_to "/adventure/#{params[:game_session]}", flash: {validate: "Session rejointe !"}
  end

  def end_day
    session = GameSession.find(params[:id])
    session.roles.each do |player|
      UserMailer.end_day(player.user, session).deliver_now!
    end
    redirect_to "/adventure/#{params[:id]}", flash: { validate: "Session du jour fini !"}
  end

  def show
    if user_signed_in?
      @user = User.find(current_user.id)
      @new_charac = Role.new
    end
    @session = GameSession.new
    @game = GameSession.find(params[:id])
    @characters = @game.characters
    @gm = Role.find_by(game_session: @game, game_master: "true").user
  end

  def update
    session = params[:game_session]
    GameSession.find(params[:id]).update(date: "#{session["date(4i)"]}:#{session["date(5i)"]}:00 #{session["date(3i)"]}/#{session["date(2i)"]}/#{session["date(1i)"]}")
    redirect_to "/adventure/#{params[:id]}", flash: {validate: "Date de la session programmée"}
  end
end
