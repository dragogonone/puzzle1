class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users/new
  def new
    if logged_in?
      redirect_to controller: 'puzzle', action: 'index'
    else
      @user = User.new
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.update_attribute(:created_at,Time.now.to_s(:db))
      if @user.save
        log_in @user
        redirect_to controller: 'puzzle', action: 'index'
      else
        render 'new'
      end
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_user
  #     @user = User.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
    private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
