class StoreReading
  include Service

  def initialize(station, params)
    @params = params
    @station = station
  end

  def call
    return false unless @station
    return false unless influxdb_client.write_point(@params[:type], data_hash)
    @station.update last_received: Time.now
    true
  end

  private

  def data_hash
    {
      values: {
        decoded: @params[:decoded_value],
        raw: @params[:raw_value]
      },
      tags: {
        station_id: @station.id
      },
      timestamp: DateTime.parse(@params[:timestamp]).to_time.to_i
    }
  end

  def influxdb_client
    @influxdb_client ||= InfluxDB::Client.new CONFIG[:influxdb]
  end
end
