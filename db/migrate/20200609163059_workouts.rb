class Workouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.decimal :height, default: nil, scale: 2
      t.decimal :weight, default: nil, scale: 1
      t.string :type
      t.string :description
      t.references :user
      t.date :date

    end
  end
end