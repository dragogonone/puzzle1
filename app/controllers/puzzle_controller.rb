class PuzzleController < ApplicationController

protect_from_forgery except: [:index, :vote]

  def index
    if logged_in?
      @user = current_user
    else
      redirect_to root_url
    end

    if current_user.coil > current_user.pikachu
      redirect_to controller: 'winners', action: 'new'
      #redirect_to :action => 'win'
    else
      render :action => 'index'
    end

  end

  def vote
  flash.now[:debug] = current_user.pikachu
    if params[:target] == 'pikachu'
      flash.now[:success] = 'ピカチュウに投票！'
      current_user.update(pikachu: current_user.pikachu+1)
    elsif params[:target] == 'coil'
      flash.now[:success] = 'コイルに投票！'
      current_user.update_attribute(:coil,current_user.coil+1)
    end
  end

end
