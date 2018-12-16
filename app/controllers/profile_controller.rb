class ProfileController < ApplicationController
  before_action :user_exist?

  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(recipient_id: params[:id])
    @character = Character.new
  end

  def add_character_to_session
    character = Character.find(params[:character][:id])
    character.game_session_id = params[:character][:game_session]
    character.save
    redirect_to "/profile/#{params[:id]}", flash: { validate: "Personnage ajouté !" }
  end
  private

  def user_exist?
    if params[:id]
      unless User.find_by(id: params[:id])
        redirect_to root_path
      end
    end
  end
end
