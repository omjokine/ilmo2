# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ilmo2_session',
  :secret      => '0235231333d3ed1598ab9a126129c205a397dfe1e8e845f7422fd1557b6978c6faddd1682a4633a19c31a5e5fbe39622acb54a6a339c894ca05c823a0ddd8bf8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
