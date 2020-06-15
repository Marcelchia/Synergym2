class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  helper_method :group_by_day


  def index

     @meals = Meal.where(user_id: current_user.id)
#       @date = meal_params[:date]

Meal.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
    # @type = @workouts.type
    # @description = @workouts.description
    # @date = @meals.date
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
     @meal.user = current_user
     @meal_categories = MealCategory.all

  end

  def update
    @meal = Meal.find(params[:id])
    redirect_to meal_path if @meal.update(meal_params)
  end

   def destroy

  @meal = Meal.find(params[:id])

         @meal.destroy
         redirect_to meals_path

  end

  private
    def check_user
      if !current_user
        redirect_to home_path
      end
    end

    def meal_params
      params.require(:meal).permit(:meal_category_id, :description, :calories, :date)
    end


    def group_by_day(obj)
      sort_by_day = -> ( d ) {d.start.strftime("%A, %b %d %y")}
      return obj.group_by(&sort_by_day)
    end


end