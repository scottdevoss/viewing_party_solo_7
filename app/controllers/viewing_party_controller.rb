class ViewingPartyController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.where.not(id: @user.id)
    @movie = MovieDetailsFacade.new(params[:movie_id])
  end
end