# Create the weather db if needed
influx = InfluxDB::Client.new CONFIG[:influxdb]
influx.create_database 'weather' if influx.list_databases.select { |db| db['name'] == 'weather' }.empty?
influx.stop!
