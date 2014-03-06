class LikesController < InheritedResources::Base
  before_filter :authenticate_user!
  def create
    @like = Like.new(params[:like])
    @like.save
    render json: @like ? @like.id : false
  end
  def destroy
    @like = Like.find(params[:id]).destroy
    redirect_to :back
  end
end
