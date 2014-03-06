require 'credit_card_validations/string'
class LessonCheckout < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :video
  
  #attr_accessible :user_id, :video_id, :payment_status, :created_at, :updated_at, :email, :credit_card_number, :card_code, :credit_card_expires_on
  
  #attr_accessor :user_id, :video_id, :payment_status, :created_at, :updated_at
  
  attr_accessible :email
  attr_accessor :email
  
  validates_presence_of :email, presence: true
  validates_format_of :email, :with => /[-!#$&'*+\/=?`{|}~.\w]+@[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])*(\.[a-zA-Z0-9]([-a-zA-Z0-9]*[a-zA-Z0-9])*)+$/,
                    :message => ' appears to be invalid'
  
     
  #validates_presence_of :credit_card_number, presence: true
  #validates_presence_of :card_number, presence: true
  #validates :visa, :mc, :discover, :amex, :presence => true, :if => :credit_card?
  
  #validates_presence_of :card_code, presence: true
  #validates_presence_of :card_month, presence: true
  #validates_presence_of :card_year, presence: true
  
  #validates :card_number, presence: true, credit_card_number: {brands: [:amex, :unionpay, :dankrot, :diners, :diners_us, :discover, :jcb, :laser, :maestro, :mastercard, :solo, :visa]}

end
