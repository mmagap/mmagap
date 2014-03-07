class InquiriesController < ApplicationController
    def new
      @inquiry = Inquiry.new
      
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inquiry }
    end
    end

    
    def create
      
      @inquiry = Inquiry.new(params[:inquiry])
            
        
        if @inquiry.deliver
           @inquiry.save
           render :create
        else
            render :new
        end

    end
    

end