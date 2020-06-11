class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  helper_method :group_by_day


  def index
    @workouts = Workout.where(user_id: params[:user_id] )
    # @type = @workouts.type
    # @description = @workouts.description
    # @date = @workouts.date
  end

  def new
    @workouts = Workout.all
    @workout_categories = WorkoutCategory.all


  end

  def create
    foobar = workout_params()

    @workout = Workout.new(foobar)
    @workout.user = current_user
     # Pass in a date
      #if (customer_params[:lisence_expiry].to_date >  Date.today+14.days)


    if @workout.save
      redirect_to @workout
      else
        #byebug
      render 'new'
  end

end



  def edit

    @workout = Workout.find(params[:id])
  end

  def update
    @user = current_user
    redirect_to profile_path if current_user.update(workout_params)
  end

  private
    def check_user
      if !current_user
        redirect_to root_path
      end
    end

    def workout_params
      params.require(:workout).permit(:workout_category_id, :description, :date)
    end


    def group_by_day(obj)
      sort_by_day = -> ( d ) {d.start.strftime("%A, %b %d %y")}
      return obj.group_by(&sort_by_day)
    end


end