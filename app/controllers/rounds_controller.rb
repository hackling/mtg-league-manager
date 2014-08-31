class RoundsController < ApplicationController
  expose :rounds
  expose :round

  def new
    Round.create!
    redirect_to rounds_path
  end
end
