class CommentsController < ApplicationController
  def create
    if params[:comment]["content"]
      comment = Comment.new
      comment.content = params[:comment]["content"]
      comment.recipient_id = params[:comment]["recipient"].to_i
      comment.sender = current_user
      if comment.save
        redirect_to "/profile/show/#{params[:comment]["recipient"]}", flash: {validate: 'Commentaire ajouté !'}
      else
        redirect_to "/profile/#{params[:comment]["recipient"]}", flash: {error: 'Database Error'}
      end
    else
      redirect_to "/profile/#{params[:comment]["recipient"]}", flash: {error: 'Commentaire vide'}
    end
  end
end
