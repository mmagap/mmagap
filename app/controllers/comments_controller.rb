Module.instance_method(:initialize_copy).bind(CommentsController).call(Class.new(ApplicationController)) if defined? CommentsController
class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @commentable = Video.find(params[:video_id])
    @comment = @commentable.comments.new
  end
  
  def create
    if params[:comment][:commentable_type] == 'Video'
      @commentable = Video.find(params[:comment][:commentable_id])
    elsif params[:comment][:commentable_type] == 'StudentTeacherProfile'
      @commentable = StudentTeacherProfile.find(params[:comment][:commentable_id])
    else
      @commentable = Comment.find(params[:comment][:commentable_id])
    end
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id= current_user.id 
		if @comment.save
      if params[:comment][:commentable_type] == 'StudentTeacherProfile'
        MessageSender.send_message(@comment.content, current_user, @commentable.user)
        redirect_to @commentable, notice: 'Message sended!'
      else
  		  redirect_to Video.find(params[:video_id]), notice: "Comment created."
      end
  	else
      if params[:comment][:commentable_type] == 'StudentTeacherProfile'
        redirect_to @commentable, notice: 'Try again!'
      else
    	 redirect_to Video.find(params[:video_id]), notice: 'Try again! '
      end
 		end
	end
  
end
