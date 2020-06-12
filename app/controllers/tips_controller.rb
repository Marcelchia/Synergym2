class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  helper_method :group_by_day



  def index



  @tips = Tip.where(user_id: current_user.id)

  end



    private
    def check_user
      if !current_user
        redirect_to home_path
      end
    end

    def workout_params
      params.require(:tips).permit(:description, :date)
    end


    def group_by_day(obj)
      sort_by_day = -> ( d ) {d.start.strftime("%A, %b %d %y")}
      return obj.group_by(&sort_by_day)
    end


end