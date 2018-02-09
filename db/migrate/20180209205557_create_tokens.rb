class CreateTokens < ActiveRecord::Migration[5.1]
  def change
    create_table :tokens do |t|
      t.text :key
      t.datetime :expires_at

      t.timestamps
    end
  end
end
