Pony.options = {
  :to => 'agholdings99@gmail.com',
  :via => :smtp,
  :via_options => {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :enable_starttls_auto => true,
    :user_name            => 'agholdings99@gmail.com',
    :password             => 'mmagap9900',
    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
    :domain               => "localhost.localdomain" #"http://localhost:3000"   BOTH ARE WORKING # the HELO domain provided by the client to the server
  }
}

#Pony.options = {
#  :to => 'vertaxweb@gmail.com',
#  :via => :smtp,
#  :via_options => {
#    :address              => 'smtp.gmail.com',
#    :port                 => '587',
#    :enable_starttls_auto => true,
#    :user_name            => 'vertaxweb@gmail.com',
#    :password             => 'india#123',
#    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
#    :domain               => "localhost.localdomain" #"http://localhost:3000"   BOTH ARE WORKING # the HELO domain provided by the client to the server
#  }
#}