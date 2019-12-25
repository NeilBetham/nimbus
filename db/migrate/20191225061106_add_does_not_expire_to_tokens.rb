class AddDoesNotExpireToTokens < ActiveRecord::Migration[5.1]
  def change
    add_column :tokens, :does_not_expire, :boolean, default: false
  end
end
