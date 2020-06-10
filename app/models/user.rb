class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



         has_many :workouts
         has_many :meals


  after_commit :update_user_name, on: :create
    def update_user_name
      user = User.last
      user.update(name: user.email.to_s.split('@')[0])
    end
end