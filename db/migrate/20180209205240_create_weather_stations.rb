class CreateWeatherStations < ActiveRecord::Migration[5.1]
  def change
    create_table :weather_stations do |t|
      t.string :name
      t.string :type
      t.datetime :last_received
      t.float :coord_north
      t.float :coord_east
      t.float :altitude

      t.timestamps
    end
  end
end
