# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#Hunter::Application.config.secret_key_base = 'a952ca612a1d3b53d865ee462407f72ccf52f8236843a14cc1e073e89dc47bb53d66b6debcf70c50b30b8d8cf201ce37271e887e9b31f33c0e163210d75211da'
require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end
Hunter::Application.config.secret_key_base = secure_token
