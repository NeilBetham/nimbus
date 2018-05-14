# == Schema Information
#
# Table name: stations
#
#  id            :integer          not null, primary key
#  name          :string
#  type          :string
#  last_received :datetime
#  coord_north   :float
#  coord_east    :float
#  altitude      :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Station < ApplicationRecord
  has_many :tokens, as: :tokenable

  validates :name, presence: true
  validates :type, presence: true
  validates :coord_north, presence: true
  validates :coord_east, presence: true
  validates :altitude, presence: true
  validates :coord_north, numericality: true
  validates :coord_east, numericality: true
  validates :altitude, numericality: true

  def influx_series(type)
    "station_#{id}_#{type}"
  end
end
