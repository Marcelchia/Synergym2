class Meal < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

   belongs_to :user
   belongs_to :meal_category

end