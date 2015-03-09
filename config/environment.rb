# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Set API end-point.
BASE_URI = "https://#{ENV['TOKEN']}@sales.geezeo.com/api/v2"

# Initialize the Rails application.
Rails.application.initialize!
