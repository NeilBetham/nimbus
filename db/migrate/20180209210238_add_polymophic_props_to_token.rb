class AddPolymophicPropsToToken < ActiveRecord::Migration[5.1]
  def change
    add_column :tokens, :tokenable_id, :interger
    add_column :tokens, :tokenable_type, :string
  end
end
