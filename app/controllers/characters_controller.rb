class CharactersController < ApplicationController
  def new
    @character = Character.new
  end

  def create
    params.each do |param|
      p param
    end
  end
end
