class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change


    rename_column :workouts, :workout_categories_id, :workout_category_id



  end
end