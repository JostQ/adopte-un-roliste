class GameSessionsController < ApplicationController
  def index
    if params[:search]
      @game_sessions = GameSession.where("city LIKE :city AND end_game = false", { :city => "%#{params[:search]}%"})
    else
      @game_sessions = GameSession.where(end_game: false)
    end
  end
end
