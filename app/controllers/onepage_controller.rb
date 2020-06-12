class OnepageController < ApplicationController
  before_action :authenticate_user!


  def index

      @user = User.find(current_user.id)

      @date = Date.today

      @name = @user.name.capitalize






      puts "========="
       puts "========="
       puts @user
        puts @name

        puts "========="
         puts "========="

  end
end