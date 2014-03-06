class SubscriptionsController < ApplicationController
  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
    if params[:PayerID]
      @subscription.paypal_customer_token = params[:PayerID]
      @subscription.paypal_payment_token = params[:token]
      @subscription.email = @subscription.paypal.checkout_details.email
    end
  end

  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save_with_payment
      @pid = params[:subscription]['plan_id'];
      @plan = Plan.find_by_id(@pid);
      @video = Video.find_by_id(@plan.video)
      @video.is_active = 1
      @video.save
      redirect_to @subscription, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
  end
  
  #def destroy
  #  @subscription = current_user.subscription
  #  @previous_plan = @subscription.plan
  #
  #  if @subscription.cancel_recurring
  #    flash[:success] = 'Subscription Canceled.'
  #  end
  #  redirect_to some_path
  #end
  #
  
  
  
  def paypal_checkout
    plan = Plan.find(params[:plan_id])
    subscription = plan.subscriptions.build
    redirect_to subscription.paypal.checkout_url(
      return_url: new_subscription_url(:plan_id => plan.id),
      cancel_url: root_url
    )
  end
end