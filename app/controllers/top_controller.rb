class TopController < ApplicationController
  def index
    @winner = User.where("win_comment not ?", nil).limit(10).order('win_at DESC')
  end
end
