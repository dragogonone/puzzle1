class WinnersController < ApplicationController

  def new
    check_user
  end

  def create
    check_user
    if !current_user.win_comment
      current_user.update(win_comment: params[:users][:win_comment], win_at: Time.zone.now.to_s(:db) )
    end
    log_out
    redirect_to root_url
  end

  def show
    @winner = User.where("win_comment not ?", nil).order('win_at DESC').page(params[:page]).per(10)
    #@winners = User.page params[:page]
  end

  private
  def check_user
    if !logged_in? || current_user.coil <= current_user.pikachu
      redirect_to root_url
    end
  end

end
