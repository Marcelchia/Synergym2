class WorkoutCategories < ActiveRecord::Migration[6.0]
   def change
  create_table :workout_categories do |t|


      t.string :description
    end
  end
end