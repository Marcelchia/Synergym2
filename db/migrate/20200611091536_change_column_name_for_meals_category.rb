class ChangeColumnNameForMealsCategory < ActiveRecord::Migration[6.0]
  def change

    rename_column :meals, :meal_categories_id, :meal_category_id
  end
end