class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  helper_method :group_by_day

  end

  def new
  end

  def create

    @workout = Workout.new(workout_params)
     # Pass in a date
      #if (customer_params[:lisence_expiry].to_date >  Date.today+14.days)
    @user = current_user

    if @workout.save
      redirect_to @workout
      else
        #byebug
      render 'new'
  end



  def edit
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
      params.require(:user).permit(:type, :description, :date)
    end

    def group_by_day(obj)
      sort_by_day = -> ( d ) {d.start.strftime("%A, %b %d %y")}
      return obj.group_by(&sort_by_day)
    end



end