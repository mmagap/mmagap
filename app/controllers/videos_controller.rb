class VideosController < ApplicationController
  before_filter :authenticate_user!, :except => [:tag_page, :index, :show]
  
  #layout :resolve_layout
  
  # GET /videos
  # GET /videos.json
  impressionist :actions=>[:show]
  def vote
    value = params[:type] == "up" ? 1 : -1
    @video = Video.find(params[:id])
    @video.add_or_update_evaluation(:votes, value, current_user)

    respond_to do |format|
      format.js 
    end
  end 

  def inappropriate
    @video = Video.find(params[:id])
    current_user.flag(@video, :inappropriate) 
    redirect_to @video, notice: "Video HAS been FLAGGED!!" 
  end

  def tag_page
    @videos = Video.tagged_with(params[:tag]).page(params[:page]).per(10)
    respond_to do |format|
      format.html # index.html.erb
      format.js { render "renew_results"}
    end
  end


  def index
    
    process_search_params
  
    respond_to do |format|
      format.html # index.html.erb
      format.js { render "renew_results" }
    end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show


    @video = Video.find(params[:id])
    
    @vid = params[:id]
    #@video = Video.where(:id=>@vid, :is_active=>'1').take
    #@video = Video.where("id = ? AND is_active = ?", @vid, 1)
 
      @video_id = (/([\w-]{11})/.match(@video.video_link)).to_s
      @embed_code =  %Q{<iframe title="YouTube video player" style=" margin-top: 24px;" width="640" height="390" src="http://www.youtube.com/embed/#{ @video_id}" frameborder="0" allowfullscreen></iframe>}
      
   
    @commentable = @video
    @comments = @commentable.comments
    @comment = Comment.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end
 
  # GET /videos/new
  # GET /videos/new.json
  def new
    @video = Video.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  
  # GET /videos/1/edit
  def edit
    @video = Video.find(params[:id])
  end

  # POST /videos
  # POST /videos.json
  def create
    
    #@video = params
    params[:video]['price'] = '0.00';
    params[:video]['is_active'] = '1';
        
    @video = current_user.videos.build(params[:video])
    respond_to do |format|
      if @video.save
        #@video.convert
        VideoMailer.video_confirmation(@video).deliver
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end


  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    @video.destroy

    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end
  
  
  
  # GET /videos/lesson
  # GET /videos/lesson.json
  def lesson
    @video = Video.new
    @tags = Tag.find(:all)
    
    @mytag = []
    @tags.each do |tag|
      @mytag.push(tag.name)
    end

    respond_to do |format|
      format.html # lesson.html.erb
      format.json { render json: @video }
    end
  end
  
   # POST /videos
  # POST /videos.json
  def lesson_create
    
    #@video = params
    params[:video]['category'] = 'Lesson';
    params[:video]['is_active'] = '0';
     

    @video = current_user.videos.build(params[:video])
    if @video.save
     
      @title = params[:video]['title']
      @price = @subscriptions_price
      @rtime = @subscriptions_time
      @video_id = @video.id
      
      @lastinsertid = Plan.create(:name => @title, :price => @price, :time => @rtime, :video_id => @video_id)
     
      #redirect_to(new_subscription_path,1)
      redirect_to :controller => 'subscriptions', :action => 'new', :plan_id =>  @lastinsertid.id
    else
      respond_to do |format|
        format.html { render action: "lesson" }
        format.js
      end  
    end
  end
  
  def show_lesson_video
    
    @vid = params[:id]
    @userid = current_user.id
    @video1 = Video.find(@vid) 
    
    
    if (@video1.user_id != @userid)
      
      @pyment_status = LessonCheckout.where("user_id = ? AND video_id = ?", @userid, @vid)
      
     
      if  !@pyment_status.empty?
         
          @pyment_status.each do |p_stats|
           
            if (p_stats['payment_status'] !='' && p_stats['payment_status']=='success')
                @video = @video1
                @commentable = @video
                @comments = @commentable.comments
                @comment = Comment.new
                respond_to do |format|
                  format.html # show.html.erb
                  format.json { render json: @video }    
                end 
            else
              redirect_to "/purches_lesson_video/#{@vid}"
            end   
            
          end  
          
      else
          redirect_to "/purches_lesson_video/#{@vid}"
      end
    
    else
      @video = @video1
      @commentable = @video
      @comments = @commentable.comments
      @comment = Comment.new
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @video }    
      end 
    end
  end
    
    
  def purches_lesson_video
    
    @vid = params[:id]
    @video = Video.find(@vid)
    @lesson_checkout = LessonCheckout.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end
  
  def my_checkout
    
    
    @data = params
    
    #@vid = User.find(params[:id])
    #@video = Video.find(@vid)
    
    #respond_to do |format|
      #format.html # show.html.erb
      #format.json { render json: @video }
    #end
  end
  
  def my_checkout_create
    
    @vid = params[:id]
    @video = Video.find(@vid)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end   
  
  private

    def process_search_params

      if params[:q].present? && params[:q][:created_at_lteq].present? && params[:q][:created_at_lteq] != "active"
         time_days = params[:q][:created_at_lteq].to_i
      else
          time_days = 10000
      end

      if params[:q]
        params[:tag] ||= params[:q][:tag] unless params[:q][:tag].nil? || params[:q][:tag].empty?
      end

      if params[:tag]
        @search = Video.search(params[:q])
        @videos = @search.result(:distinct => true).tagged_with(params[:tag]).order("created_at desc").page(params[:page]).per(10)
      
      else
        @search=Video.search(params[:q])
        @videos= @search.result(:distinct => true).last_x_days(time_days).order("created_at desc").page(params[:page]).per(10)
        if params[:q]
          unless params[:q][:created_at_lteq]
            @tagged_videos = Video.tagged_with(params[:q][:title_cont])
            @tagged_videos.each { |tv| @videos << tv unless @videos.include? tv }
          end
        end
      end
      
   
    end
    
    
    #private
    #def resolve_layout
      #case action_name
      #when "simple"
       # "video"
      #when "advanced"
      #  "video"
      #else
      #  "application"
      #end
    #end


end
