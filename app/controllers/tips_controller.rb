class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  helper_method :group_by_day



  def index

    @tips = Tip.where(user_id: current_user.id)

  end