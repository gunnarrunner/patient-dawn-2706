class TeamsController < ApplicationController
  # def index
    
  # end

  # def show
    
  # end

  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    competition = Competition.find(params[:team][:competition_id])
    competition.teams.create!(team_params)
    redirect_to "/competitions/#{competition.id}"
  end

  # def edit
    
  # end

  # def update
    
  # end

  # def destroy
    
  # end

private
  def team_params
    params.require.permit(:nickname, :hometown)
  end
end