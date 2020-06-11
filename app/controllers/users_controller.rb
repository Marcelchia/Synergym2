class UsersController < ApplicationController
  before_action :check_user
  helper_method :group_by_day


  def show
    # @user = User.find(params[:id])
    # @user = User.find_by_id(params[:id])
    # @user= current_user
    # @user = User.where(id: params [:id])
    @user = User.find(params[:id])
    puts "=============="
    puts "=============="
    puts @user
    puts @user.weight
    puts "=============="
    puts "=============="

    @weight = @user.weight
    @height = @user.height

    if @weight && @height

    @bmi = (10000*(@weight/(@height*@height))).round(2)
    @protein = (0.8*@weight).round(2)

    else

    @bmi = 0
    @protein = 0

    end


    @date = Date.today

    @updateddate = @user.updated_at
    puts "================="
    puts "================="
    puts "================="
    puts @user
    puts @updateddate
    puts @time
    puts "================="
    puts "================="
    puts "================="

  end

  def edit
      @user = current_user
  end

  def update
    @user = current_user
    @weight = @user.weight
    @height = @user.height

    puts "================="
    puts "================="
    puts "================="
    puts @user
    puts @weight
    puts @height
    puts "================="
    puts "================="
    puts "================="

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