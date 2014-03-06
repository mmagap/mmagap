class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

    def create
    @request = current_user.requests.build(params[:request])

    respond_to do |format|
      if @request.save
        RequestMailer.request_confirmation(@request).deliver
        format.html { redirect_to @request, notice: 'Video was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end
end 