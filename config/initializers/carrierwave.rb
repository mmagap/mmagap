CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJPHN452IPYUBLHPA',                        # required
    :aws_secret_access_key  => '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',                       # required
}
  config.fog_directory  = 'devmmagap'                     # required
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}


end