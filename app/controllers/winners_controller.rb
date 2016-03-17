class WinnersController < ApplicationController

  def new
    check_user
  end

  def create
    check_user
    if current_user.win_comment
      log_out
      redirect_to root_url
    else
      current_user.update(win_comment: params[:users][:win_comment], win_at: Time.now.to_s(:db) )
    end
  end

  private
  def check_user
    if !logged_in? || current_user.coil <= current_user.pikachu
      redirect_to root_url
    end
  end

end
