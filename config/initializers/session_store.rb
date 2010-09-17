# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_near_city_site_session',
  :secret      => '3ef6b4219d0ff7427b6a6a5b29e668050d5533548193f0d9471b89d0c7e6940892dd5b9a32bca945f6ba2871a5c93b97a8fe9720b61c519d002577efdd0601eb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
