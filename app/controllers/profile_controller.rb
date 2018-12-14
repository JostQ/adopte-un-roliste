class ProfileController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(recipient_id: params[:id])
  end
end
