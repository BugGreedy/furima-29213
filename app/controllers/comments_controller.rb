class CommentsController < ApplicationController
  def create
    Comment.create(commment_params)
    redirect_to "/item/#{comment.item.id}"
  end

  private
  def commment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
