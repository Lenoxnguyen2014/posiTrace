class CreateGeolocations < ActiveRecord::Migration[7.0]
  def change
    create_enum :geolocation_type, ['ipv4', 'ipv6']
    create_table :geolocations do |t|
      t.string :ip
      t.enum :typeip, enum_type: :geolocation_type, default: 'ipv4'
      t.string :continent_code
      t.string :continent_name
      t.string :country_code
      t.string :country_name
      t.string :region_code
      t.string :region_name
      t.string :city
      t.string :zip
      t.decimal :latitude, {:precision=>16, :scale=>6}
      t.decimal :longitude, {:precision=>16, :scale=>6}
      t.jsonb :location

      t.timestamps
    end
  end
end
