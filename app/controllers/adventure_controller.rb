class AdventureController < ApplicationController
  def create_and_research

    @session = GameSession.new
    @roleplay = Roleplay.all
  end
  def create
  end
  def show
    @game = GameSession.find(params[:id])
    @characters = @game.characters
  end
end
