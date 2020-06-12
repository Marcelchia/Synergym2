class TipsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user




  def index

  @tips = Tip.where(user_id: current_user.id)

  end


  def new
    @tips = Tip.all

  end

  def create

      foobar = tip_params()

      @tip = Tip.new(foobar)
      @tip.user = current_user


      if @tip.save
        redirect_to @tip
        else
          #byebug
        render 'new'
    end

end


  def show

  @tip = Tip.find(params[:id])



  end

 def destroy

  @tip = Tip.find(params[:id])

         @tip.destroy
         redirect_to tips_path

  end


    private
    def check_user
      if !current_user
        redirect_to home_path
      end
    end

    def tip_params
      params.require(:tip).permit(:description)


    end



end