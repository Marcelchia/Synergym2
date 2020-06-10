class ChangeDataTypeForHeightAndWeight < ActiveRecord::Migration[6.0]


def change
    change_column :users, :height, :decimal,:precision=>50,:scale=>2, default: nil
    change_column :users, :weight, :decimal,:precision=>50,:scale=>1, default: nil
  end

end