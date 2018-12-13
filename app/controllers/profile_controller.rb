class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = Comment.where(recipient_id: params[:id])
  end
end
