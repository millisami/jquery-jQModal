# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jquery_livequery_session',
  :secret      => '494223a46833571f14342de4e9fe5a99fb46fe06112cb63dfde41c653c6dcb32e913f2bd76c4849fb8097750c8a265a0f983a6d1fcd0e0cf7b288f9f02e6e2af'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
