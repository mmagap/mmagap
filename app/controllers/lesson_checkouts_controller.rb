class LessonCheckoutsController < ApplicationController
  # GET /lesson_checkouts
  # GET /lesson_checkouts.json
  def index
    @lesson_checkouts = LessonCheckout.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lesson_checkouts }
    end
  end

  # GET /lesson_checkouts/1
  # GET /lesson_checkouts/1.json
  def show
    @lesson_checkout = LessonCheckout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson_checkout }
    end
  end

  # GET /lesson_checkouts/new
  # GET /lesson_checkouts/new.json
  def new
    
    #@lesson_checkout = params
    #@vid = params[:video_id]
    #@uid = current_user.id
    #
    #@lesson_checkout = LessonCheckout.new
    
    #@a = LessonCheckout.where("video_id = ? AND user_id = ?", @vid, @uid)
    #if  @a.nil?
    #  @lesson_checkout1['order_id'] = @a[:LessonCheckout]['id']
    #else
    #  
    #   #@lesson_checkout1 = LessonCheckout.create(LessonCheckout.new('lesson_checkout'=>:video_id=>@vid,:user_id=>@uid,:payment_status=>'pending', :created_at=>Time.now, :updated_at=>Time.now))
    #   #@lesson_checkout1.save
    #  
    #    #@lastinsertid =LessonCheckout.create(:user_id=> @uid,:video_id=> @vid, :payment_status=>'pending')
    #    #@lesson_checkout2['order_id'] = @lastinsertid.id
    #end  
    
    #@lesson_pay = Video.find(params[:video_id])
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @lesson_checkout }
    #  
    #end
  end

  # GET /lesson_checkouts/1/edit
  def edit
    @lesson_checkout = LessonCheckout.find(params[:id])
  end

  # POST /lesson_checkouts
  # POST /lesson_checkouts.json
  def create
    
    @vid = params[:lesson_checkout][:video_id]
    @uid = current_user.id
    params[:lesson_checkout]['user_id'] =  current_user.id
    params[:lesson_checkout]['payment_status'] = 'pending'
    params[:lesson_checkout]['created_at'] = Time.now
    params[:lesson_checkout]['updated_at'] = Time.now
    
    
    
    @a = LessonCheckout.where("user_id = ? AND video_id = ?", @uid, @vid).last
    
    if !@a.nil?
      @orderid = @a['id']
    else
      
      @lesson_checkout = LessonCheckout.new(params[:lesson_checkout])
      @lesson_checkout.save
      @orderid = @lesson_checkout.id;
    end 
    
    redirect_to paypal_pro_path(@orderid)
    
    
    
    #@lesson_checkout.save
    #respond_to do |format|
    #  if @lesson_checkout.save
    #    format.html { redirect_to @lesson_checkout, notice: 'Lesson checkout was successfully created.' }
    #    format.json { render json: @lesson_checkout, status: :created, location: @lesson_checkout }
    #  else
    #    format.html { render action: "new" }
    #    format.json { render json: @lesson_checkout.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PUT /lesson_checkouts/1
  # PUT /lesson_checkouts/1.json
  def update
    @lesson_checkout = LessonCheckout.find(params[:id])

    respond_to do |format|
      if @lesson_checkout.update_attributes(params[:lesson_checkout])
        format.html { redirect_to @lesson_checkout, notice: 'Lesson checkout was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson_checkout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_checkouts/1
  # DELETE /lesson_checkouts/1.json
  def destroy
    @lesson_checkout = LessonCheckout.find(params[:id])
    @lesson_checkout.destroy

    respond_to do |format|
      format.html { redirect_to lesson_checkouts_url }
      format.json { head :no_content }
    end
  end
  
  
  
  
  def paypal_pro
    
    @OID = params['id'] 
    @order_status = LessonCheckout.where("id = ? ", @OID)
    
    @order_status.each do |v|
      @vid = v[:video_id]
      @lesson_pay = Video.find(@vid)
      @lesson_pay['order_id'] = @OID 
    end 
   
     
  end
  
  def paypal_do_direct
    
    @amount = params[:price] # amount paid
    @first_name = params[:firstname]
    @last_name = params[:lastname]
    @email = params[:email]
    @card_code = params[:card_code]
    @card_no = params[:credit_card_number] # credit card number
    @card_type = params[:card_type]['get_card'] # can be Visa, Mastercard, Amex etc
    @month = params[:credit_card_expires_on]['credit_card_ex(2i)']
    @year = params[:credit_card_expires_on]['credit_card_ex(1i)']
    @exp_date = @month+@year # expiry date of the credit card

    username = @API_USERNAME
    password = @API_PASSWORD
    signature = @API_SINGNATURE
    
    
    
    #ipaddress = '192.168.1.1' # can be any IP address
    #amount = '100.00' # amount paid
    #card_type = 'VISA' # can be Visa, Mastercard, Amex etc
    #card_no = '4512345678901234' # credit card number
    #exp_date = '022010' # expiry date of the credit card
    #first_name = 'Sau Sheong'
    #last_name = 'Chang'
    
    ipaddress = '192.168.1.1' # can be any IP address
    amount = @amount # amount paid
    card_type = @card_type # can be Visa, Mastercard, Amex etc
    card_no = @card_no # credit card number
    exp_date = @exp_date # expiry date of the credit card
    first_name = @first_name
    last_name = @last_name
        
    #paypal = Paypal.new(username, password, signature)
    #@response = paypal.do_direct_payment_sale(ipaddress, amount, card_type,card_no, exp_date, first_name, last_name)
    #
    #if @response.ack == 'Success' then
    #  # do your thing
    #  @OID = params['id']
    #  @order_status = LessonCheckout.find_by_id(@OID)
    #  @order_status.payment_status = 'success'
    #  @order_status.save
    #  
    #  @res = "Your payment process successfully completed."
    #else
    #  @res = "Your payment process have been failed"
    #end
  end
  
  
  
  def paypal_success
    
    @OID = params['id']
    
    if !@OID.nil?
      #@order_status = LessonCheckout.where("id = ? ", @OID)
      @order_status = LessonCheckout.find_by_id(@OID)
      @order_status.payment_status = 'success'
      @order_status.save
    end
  end
  
  def paypal_failure
    
    @OID = params['id']
    if !@OID.nil?
      #@order_status = LessonCheckout.where("id = ? ", @OID)
      @order_status = LessonCheckout.find_by_id(@OID)
      @order_status.payment_status = 'failed'
      @order_status.save
    end
  end
  
  def paypal_ipn
    
  end
end
