# Omniauth::Dropbox

An OmniAuth strategy for connecting to Dropbox.

Add this to `config/initializers/devise.rb`

    Devise.setup do |config|
      ...
      config.omniauth :dropbox, APP_ID, APP_SECRET
    end

