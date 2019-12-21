class ChangeTypeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :stations, :type, :device_name
  end
end
