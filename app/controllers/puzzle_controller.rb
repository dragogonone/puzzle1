class PuzzleController < ApplicationController

  def index
    if logged_in?
      @user = current_user
    else
      redirect_to root_url
    end
  end

  def vote
    if params[:users][:target] == 'pikachu'
      flash.now[:success] = 'ピカチュウに投票！'
      current_user.update_attribute(:pikachu,current_user.pikachu+1)
    elsif params[:users][:target] == 'coil'
      flash.now[:success] = 'コイルに投票！'
      current_user.update_attribute(:coil,current_user.coil+1)
    else
      render :text => '投票先がちがうよ'
    end
    if current_user.coil > current_user.pikachu
      redirect_to controller: 'winners', action: 'new'
      #redirect_to :action => 'win'
    else
      render :action => 'index'
    end
  end

end
