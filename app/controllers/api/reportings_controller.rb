module Api
  class ReportingsController < ApiController
    before_action :set_station, only: [:reading]

    def reading
      if StoreReading.call(reading_params)
        head :created
      else
        head :bad_request
      end
    end

    def health

    end

    private

    def set_station
      unless @station = station
        head :unauthorized
      end
    end

    def station
      if @token.tokenable.is_a?(Station)
        @token.tokenable
      end
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
