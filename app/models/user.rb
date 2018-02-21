class User < ApplicationRecord
  has_secure_password
  has_many :tokens, as: :tokenable
end
