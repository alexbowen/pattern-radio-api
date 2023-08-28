class Journey < ApplicationRecord
  def polygon
    RGeo::GeoJSON.encode(travel_area).to_json
  end
end