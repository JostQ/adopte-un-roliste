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
    @gm = Role.find_by(game_session: @game, game_master: "true").user
  end
end
