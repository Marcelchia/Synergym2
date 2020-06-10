class Workouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|

      t.string :type
      t.string :description
      t.references :user
      t.date :date

    end
  end
end