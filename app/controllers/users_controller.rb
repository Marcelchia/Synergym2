class UsersController < ApplicationController
  before_action :check_user
  helper_method :group_by_day


  def show
    @user = current_user

  end

  def edit
      @user = current_user
  end

  def update
    @user = current_user
    redirect_to profile_path if current_user.update(user_params)
  end

  private
    def check_user
      if !current_user
        redirect_to root_path
      end
    end

    def user_params
      params.require(:user).permit(:name, :weight, :height)
    end

    def group_by_day(obj)
      sort_by_day = -> ( d ) {d.start.strftime("%A, %b %d %y")}
      return obj.group_by(&sort_by_day)
    end



end