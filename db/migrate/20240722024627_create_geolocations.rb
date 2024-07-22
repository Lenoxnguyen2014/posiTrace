class CreateGeolocations < ActiveRecord::Migration[7.0]
  def change
    create_table :geolocations do |t|
      t.string :ip
      t.string :type
      t.string :continent_code
      t.string :continent_name
      t.string :region_code
      t.string :region_name
      t.string :city
      t.string :zip
      t.string :latitude
      t.string :longtitude
      t.json :location

      t.timestamps
    end
  end
end
