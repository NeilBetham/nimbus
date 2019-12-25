module Admin
  class StationsController < AdminController
    before_action :set_station, only: [:edit, :update, :destroy]

    def index
      @stations = Station.all
    end

    def new
      @station = Station.new
    end

    def edit; end

    def create
      @station = Station.new station_params
      if @station.save
        redirect_to action: :index, flash: 'Station added!'
      else
        render :new, flash: 'Error in station info.'
      end
    end

    def update
      if @station.update station_params
        render :edit, flash: 'Station updated!'
      else
        render :edit, flash: 'Error in station info.'
      end
    end

    def destroy
      @station.destroy
      redirect_to action: :index, flash: 'Station removed.'
    end

    private

    def station_params
      params.require(:station).permit(
        :name,
        :device_name,
        :coord_north,
        :coord_east,
        :altitude
      )
    end

    def set_station
      @station = Station.find(params[:id])
    end

  end
end
