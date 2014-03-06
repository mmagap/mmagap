class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
  before_filter :all_tags
  before_filter :paypal_details
  before_filter :gethostname
  before_filter :subscriptions_plan
  
  
  def subscriptions_plan
    @subscriptions_price = 11
    @subscriptions_time = 1 
  end

  def paypal_details
  
    # Output the hostname
    @PAYMENT_MODE = 'live'
    @MERCHANT_id=""
    
    if @PAYMENT_MODE=='test'
      @PAYPAL_URL = 'https://www.sandbox.paypal.com/cgi-bin/webscr'
      @MERCHANT_id = 'rose_mearchant_007@gmail.com'
      
      @API_USERNAME="rose_mearchant_007_api1.gmail.com"
      @API_PASSWORD="1390825574"
      @API_SINGNATURE="AFcWxV21C7fd0v3bYYYRCpSSRl31Ah-F.xFIcnE9aJE1bPC558lkznUK"

    else
      @PAYPAL_URL = 'https://www.paypal.com/cgi-bin/webscr';
      @MERCHANT_id='agholdings99@gmail.com';
      
      @API_USERNAME="agholdings99_api1.gmail.com"
      @API_PASSWORD="U7SBD6FZ5AEBFVGD"
      @API_SINGNATURE="AFcWxV21C7fd0v3bYYYRCpSSRl31A7E6VqdrJYJvWHCoG1b4IDrOlVyT"
      
    end  
  end
  
  
  def gethostname
    @host = request.host
    if (@host=='localhost')
      @hostname = "http://"+@host+":3000"
    else
      @hostname = "http://"+@host
    end  
  end  
  
  def all_tags
    @tags = Tag.find(:all)
    @mytag = []
    @tags.each do |tag|
    @mytag.push(tag.name)
    end
  end
  
end
