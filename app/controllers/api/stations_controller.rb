module Api
  class StationsController < ApiController
    before_action :should_be_station

    def reading
      if StoreReading.call(station, reading_params)
        head :created
      else
        head :bad_request
      end
    end

    def health; end

    private

    def should_be_station
      head :unauthorized unless station
    end

    def station
      return @token.tokenable if @token.tokenable.is_a?(Station)
    end

    def reading_params
      params.require(:reading).permit(
        :type,
        :raw_value,
        :decoded_value,
        :timestamp
      )
    end

    def health_params
      params.require(:health).permit(
        :message_count,
        :failed_message_count,
        :rssi,
        :desync_count
      )
    end
  end
end
