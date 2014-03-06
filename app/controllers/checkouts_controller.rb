class CheckoutsController < ApplicationController

  
  def checkout
  
    response = EXPRESS_RECURRING_GATEWAY.setup_agreement(:description => description, return_url => registration_complete_url, :cancel_return_url => registration_new_url)
    redirect_to EXPRESS_RECURRING_GATEWAY.redirect_url_for(response.token) 
  end  

  def complete
    token = params[:token]
    start_date = Time.now
    response = EXPRESS_RECURRING_GATEWAY.create_profile(token,
              :description => description,
              :start_date => start_date,
              :frequency => frequency_in_months,
              :amount => amount_in_dollars,
              :auto_bill_outstanding => true)
     if response. success?
          #handle success
     else
          #handle failure
     end
  end  

  
    



end
