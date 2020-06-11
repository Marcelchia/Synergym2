class AddDateToMeals < ActiveRecord::Migration[6.0]
  def change
      add_column :meals, :date, :datetime
  end
end