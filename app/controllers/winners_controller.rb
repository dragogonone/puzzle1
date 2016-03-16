class WinnersController < ApplicationController

  def new
    check_user
  end

  def show
    @winner = User.where("win_comment not ?", nil)
  end

  def create
    check_user
    if current_user.win_comment
      render 'show'
    else
      current_user.update_attribute(:win_comment,params[:users][:win_comment])
      render 'show'
    end
  end

  private
  def check_user
    if !logged_in? || current_user.coil <= current_user.pikachu
      redirect_to root_url
    end
  end

end
