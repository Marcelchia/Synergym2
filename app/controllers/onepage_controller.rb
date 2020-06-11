class OnepageController < ApplicationController
  before_action :authenticate_user!


  def index

      @user = current_user
      @date = Date.today

  end
end