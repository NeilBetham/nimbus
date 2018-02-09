class User < ApplicationRecord
  has_many :tokens, as: :tokenable
end
