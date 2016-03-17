class TopController < ApplicationController
  def index
    @winner = User.where("win_comment not ?", nil)
  end
end
