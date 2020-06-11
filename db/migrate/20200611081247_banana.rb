class Banana < ActiveRecord::Migration[6.0]
  def change

remove_column :workouts, :type
remove_column :meals, :type



add_reference :workouts, :workout_categories, index: true, foreign_key: true

add_reference :meals, :meal_categories, index: true, foreign_key: true



  end
end