class ProfileController < ApplicationController
  before_action :user_exist?

  def show
    @user = User.find(params[:id])
    @comments = Comment.where(recipient_id: params[:id])
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
