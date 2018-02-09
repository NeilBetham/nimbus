class WeatherStation < ApplicationRecord
  has_many :tokens, as: :tokenable
end
