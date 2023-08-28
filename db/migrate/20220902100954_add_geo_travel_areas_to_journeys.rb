class AddGeoTravelAreasToJourneys < ActiveRecord::Migration[7.0]
  def change
    add_column :journeys, :travel_area, :geometry, geographic: true, srid: 4055
  end
end
