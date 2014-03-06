ActiveAdmin.register AdminUser do
  menu :parent => "Administration",:priority => 1
end
ActiveAdmin.register User do
  menu :parent => "Administration",:priority => 2
end





ActiveAdmin.register CmsPage do
  menu :parent => "Pages",:priority => 1
end



#ActiveAdmin.register HomePageBlock do
#  menu :parent => "Pages",:priority => 2
#end
#
#ActiveAdmin.register MenuManager do
#  menu :parent => "Menu",:priority => 1
#  
#end
#ActiveAdmin.register MenuItem do
#  menu :parent => "Menu", :priority => 2
#end
#ActiveAdmin.register SupportedBrand do
#  menu :parent => "Others",:priority => 1
#end
#
#ActiveAdmin.register Certifications do
#  menu :parent => "Others",:priority => 2
#end
#
#ActiveAdmin.register Slider do
#  menu :parent => "Others",:priority => 3
#end
#
#ActiveAdmin.register SliderLayer do
#  menu :parent => "Others",:priority => 4
#end
#
#ActiveAdmin.register Project do
#  menu :parent => "Others",:priority => 5
#end
#
#ActiveAdmin.register Task do
#  menu :parent => "Others",:priority => 6
#end
#
#ActiveAdmin.register PaypalGateway do
#  menu :parent => "Payment Gateways",:priority => 1
#end
#
#ActiveAdmin.register OrderHistroy do
#  menu :parent => "Order History",:priority => 1
#end



#ActiveAdmin.register Setting do
  #menu :parent => "Administration"
#end