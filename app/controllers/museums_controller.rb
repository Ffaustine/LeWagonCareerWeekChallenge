require "json"
require "open-uri"

class MuseumsController < ApplicationController

  def index
    lat = params[:lat]
    lng = params[:lng]
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?proximity=#{lng},#{lat}&access_token=#{ENV['MAPBOX_ACCESS_TOKEN']}"
    response = URI.open(url).read
    data = JSON.parse(response)

    museums = []

    data["features"].map do |feature|
      postcode = feature["context"][0]["text"]
      museums << feature["text"]
    end

    group_museums = museums.group_by(postcode)


    render json: group_museums
  end
end
