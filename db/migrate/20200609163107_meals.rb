class Meals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|

      t.string :type
      t.string :description
      t.references :user
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end
  end
end