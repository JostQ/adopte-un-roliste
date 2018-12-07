class RoleplayController < ApplicationController
  def index
    @roleplay = Roleplay.all
  end
end
