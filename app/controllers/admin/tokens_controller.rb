module Admin
  class TokensController < AdminController
    before_action :set_station, only: [:create, :destroy]
    before_action :set_token, only: [:destroy]

    def create
      @station.tokens.create(does_not_expire: true)
      redirect_back fallback_location: admin_station_path(@station), notice: "Token Created"
    end

    def destroy
      @token.destroy
      redirect_back fallback_location: admin_station_path(@station), notice: "Token Destroyed"
    end

    private

    def set_station
      @station = Station.find(params[:station_id])
    end

    def set_token
      @token = @station.tokens.find(params[:id])
    end
  end
end
