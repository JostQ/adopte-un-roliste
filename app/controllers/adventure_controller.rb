class AdventureController < ApplicationController
  def create_and_research

    @session = GameSession.new
    @roleplay = Roleplay.all
  end
  def create
  end
end
