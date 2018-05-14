class StoreReading
  include Service

  def initialize(params)
    @params = params
    @station = Station.find params[:station_id]
  end

  def call
    return false unless @station
    if influxdb_client.write_point(@station.influx_series(params[:type]), data_hash)
      @station.update last_received: Time.now
      true
    end
  end

  private

  def data_hash
    {
      values: {
        decoded: params[:decoded_value],
        raw: params[:raw_value]
      },
      tags: {
        station_id: @station.id
      }
      timestamp: DateTime.parse(params[:timestamp]).to_time.to_i
    }
  end

  def influxdb_client
    @influx_client ||= InfluxDB::Client.new CONFIG[:influxdb]
  end
end
