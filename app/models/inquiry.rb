class Inquiry < ActiveRecord::Base
  # attr_accessible :title, :body
  
#class Inquiry
#  extend ActiveModel::Naming
#  include ActiveModel::Conversion
#  include ActiveModel::Validations
#  include ActionView::Helpers::OutputSafetyHelper

  include ActionView::Helpers::TextHelper
  attr_accessible :name, :email, :subject, :message
  #attr_accessor :name, :email, :subject, :message

  validates :name, :presence => true
  validates :subject, :presence => true
  validates :email, :format => { :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :message, :length => { :minimum => 10, :maximum => 1000 }
  
    
#  def initialize(attributes = {})
#    attributes.each do |name, value|
#      send("#{name}=", value)
#           
#    end
#  end
#  
  def deliver
    return false unless valid?
    
    Pony.mail({
      :from => %("#{name}" <#{email}>),
      :cc=> 'contactus@mmagap.com',
      :reply_to => email,
      :subject => subject,
      :body => message,
      :html_body => simple_format(message)
    })
    
      Pony.mail({
      :to => %("#{name}" <#{email}>),
      :from => email,
      :subject => "Receive an e-mail from mmagap.com ",
      :body => 'Thank you message from MMAGAP.COM',
      :html_body => simple_format('Dear customer, thank you for contacting us. We at MMAGap.com are always striving to improve our website and customer service, and will get back to you shortly. 
Best regards from our team at <a href="http://mmagap.com/">www.mmagap.com</a>')
    })
    
  end
      
  def persisted?
    false
  end
end