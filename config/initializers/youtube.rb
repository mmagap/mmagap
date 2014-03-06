YOUTUBE_IT = YAML.load_file("#{::Rails.root}/config/youtube_it.yml")[::Rails.env]
YT_KEY = YOUTUBE_IT[:dev_key]
YT_USERNAME = YOUTUBE_IT[:username]
YT_PASSWORD = YOUTUBE_IT[:password]
CLIENT_ID = YOUTUBE_IT[:client_id]
SECRET = YOUTUBE_IT[:client_secret]

# Client secret: 03i0Gre2iqZ79tLbGGLzfENL
# Client id: 699449733727.apps.googleusercontent.com