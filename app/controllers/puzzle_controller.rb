class PuzzleController < ApplicationController

protect_from_forgery except: [:index, :vote]

  def index

    #ログイン判定
    if logged_in?
      @user = current_user

      #コイルが勝っていたら遷移
      if current_user.coil > current_user.pikachu
        redirect_to controller: 'winners', action: 'new'
      else
        render :action => 'index'
      end
    else
      redirect_to root_url
    end

  end

  def vote

    #投票された対象のデータベースの値をインクリメント
    if params[:target] == 'pikachu'
      flash[:success] = 'ピカチュウに投票！'
      current_user.update_attribute(:pikachu,current_user.pikachu+1)
    elsif params[:target] == 'coil'
      flash[:success] = 'コイルに投票！'
      current_user.update_attribute(:coil,current_user.coil+1)
    end

    redirect_to :action => 'index'

  end

end
