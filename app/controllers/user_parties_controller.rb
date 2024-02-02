class UserPartiesController < ApplicationController
  def create 
    @viewing_party = ViewingParty.new(viewing_party_params)
    @users = User.all
    if @viewing_party.save
      @users.each do |user|
        @viewing_party.users << user
      end
    end
      redirect_to "/users/#{params[:user_id]}"
  end


  private

  def viewing_party_params
    params.permit(:movie_id, :duration, :date, :start_time)
  end
end