class AddMoreColumnsToUser < ActiveRecord::Migration[6.0]
  def change
  add_column :User, :Name, :string
  # add as many columns as you need
end