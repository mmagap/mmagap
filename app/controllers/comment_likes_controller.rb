class CommentLikesController < InheritedResources::Base
  skip_before_filter  :verify_authenticity_token

  def create
    @comment_like = CommentLike.new params[:comment_like]
    if !@comment_like.was_liked_by_this_user? params[:comment_like][:user_id]
      @comment_like.save 
      render json: @comment_like.like_or_not ? @comment_like.like_or_not : @comment_like.like_or_not
    else
      render json: 'not added'
    end
  end
end
