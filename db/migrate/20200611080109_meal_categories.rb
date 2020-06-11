class MealCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_categories do |t|


      t.string :description
    end
  end
end