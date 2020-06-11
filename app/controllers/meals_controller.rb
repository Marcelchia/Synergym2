class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  helper_method :group_by_day


  def index

     # @meals = Meal.where(user_id: current_user.id)
    # @type = @workouts.type
    # @description = @workouts.description
    # @date = @workouts.date
  end

  def new
    @meals = Meal.all
    @meal_categories = MealCategory.all


  end

  def create
    foobar = meal_params()

    @meal = Meal.new(foobar)
    @meal.user = current_user
     # Pass in a date
      #if (customer_params[:lisence_expiry].to_date >  Date.today+14.days)


    if @meal.save
      redirect_to @meal
      else
        #byebug
      render 'new'
  end

end


  def show

  @meal = Meal.find(params[:id])
  @mealtype = @meal.meal_category.description

  end


  def edit

    @meal = Meal.find(params[:id])
  end

  def update
    @user = current_user
    redirect_to profile_path if current_user.update(meal_params)
  end

  private
    def check_user
      if !current_user
        redirect_to root_path
      end
    end

    def meal_params
      params.require(:meal).permit(:meal_category_id, :description, :date)
    end


    def group_by_day(obj)
      sort_by_day = -> ( d ) {d.start.strftime("%A, %b %d %y")}
      return obj.group_by(&sort_by_day)
    end


end