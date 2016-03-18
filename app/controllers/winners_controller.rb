class WinnersController < ApplicationController

  def new
    check_user
  end

  def create
    check_user
    if !current_user.win_comment
      current_user.update_attribute(:win_comment,params[:users][:win_comment])
      current_user.update_attribute(:win_at, Time.zone.now.to_s(:db))
    end
    log_out
    redirect_to root_url
  end

  def show
    @winner = User.where.not(win_comment: nil).limit(10).order('win_at DESC').page(params[:page]).per(10)
  end

  private
  def check_user
    if !logged_in? || current_user.coil <= current_user.pikachu
      redirect_to root_url
    end
  end

end
