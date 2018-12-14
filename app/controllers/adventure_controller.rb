class AdventureController < ApplicationController
  def create_and_research

    @session = GameSession.new
    @roleplay = Roleplay.all
  end

  def create
  end

  def show
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
