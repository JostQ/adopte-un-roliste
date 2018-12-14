class GameSessionsController < ApplicationController
  def index
    if params[:search]
      @game_sessions = GameSession.where("city LIKE :city AND end_game = false", { :city => "%#{params[:search]}%"})
    else
      @game_sessions = GameSession.where(end_game: false)
    end
  end

  def new
    @session = GameSession.new

    @roleplays = Roleplay.all
  end

  def create
    error = Hash.new

    session = GameSession.new
    session_info = params[:game_session]


    session.title = session_info["title"]
    session.description = session_info["description"]
    session.city = session_info["city"]
    session.roleplay = Roleplay.find(session_info[:roleplay])
    session.players_limit = session_info[:playerslimit].to_i
    session.creator = current_user

    if session.save
      session.users << current_user
      Role.find_by(user: current_user, game_session: session).update(game_master: "true")
      redirect_to "/adventure/#{session.id}", flash: {validate: "Session de jeux bien créée"}
    else
      redirect_to '/adventure', flash: {error: "GameSession Error"}
    end
  end
end
