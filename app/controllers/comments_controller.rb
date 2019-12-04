class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(restaurant_id: params[:comment][:restaurant_id],
      content: params[:comment][:content])
    @comment.save!
    @vote = current_user.votes.build(restaurant_id: params[:comment][:restaurant_id],
      star_num: params[:comment][:rating_input].to_f)
    @vote.save!
    flash[:success] = "Thanks for comment!"
    redirect_to request.referrer || root_path
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy!
    flash[:success] = "remove comment successfully!"
    redirect_to request.referrer || root_path
  end
end
