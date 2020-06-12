class AddDateAndCaloriestoMeals < ActiveRecord::Migration[6.0]
  def change

      add_column :meals, :date, :date
       add_column :meals, :calories, :int
  end
end