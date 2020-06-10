class AddHeightAndWeightToUsers < ActiveRecord::Migration[6.0]
  def change
      add_column :users, :height, :decimal, :precision => 2, default: nil
      add_column :users, :weight, :decimal, :precision => 1, default: nil
      add_column :users, :name, :string

  end
end