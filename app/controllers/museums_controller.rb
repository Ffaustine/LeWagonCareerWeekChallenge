class MuseumsController < ApplicationController
  def index
    @museums
  end
end


require "json"
require "open-uri"

url = "https://api.mapbox.com/tokens/v2/ffourcade?access_token=MAPBOX_ACCESS_TOKEN/"
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

puts "#{user["name"]} - #{user["bio"]}"
