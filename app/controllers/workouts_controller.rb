class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  helper_method :group_by_day


  def index

    @workouts = Workout.where(user_id: current_user.id).order(date: :desc)





     # @exercise = @workouts.workout_category.description



    # @workouts = Workout.where(user_id: params[:user_id] )

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


  def show
  @workout_categories = WorkoutCategory.all
  @workout = Workout.find(params[:id])
  @exercise = @workout.workout_category.description

  puts "============="
  puts "============="
  puts @workout
  puts "============="
  puts "============="


  end


  def edit

    @workout = Workout.find(params[:id])
     @workout.user = current_user
     @workout_categories = WorkoutCategory.all

  end

  def update

    @workout = Workout.find(params[:id])

    redirect_to workout_path if @workout.update(workout_params)
  end


  def destroy

  @workout = Workout.find(params[:id])

         @workout.destroy
         redirect_to workouts_path

  end

  private
    def check_user
      if !current_user
        redirect_to home_path
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