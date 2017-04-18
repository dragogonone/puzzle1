class TopController < ApplicationController
  def index
    @winner = User.where.not(win_comment: nil).limit(10).order('win_at DESC')
  end
end
