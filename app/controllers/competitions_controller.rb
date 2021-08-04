class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  # def new
    
  # end

  # def create
    
  # end

  # def edit
    
  # end
  
  # def update
    
  # end
  
  # def destroy
    
  # end
  
# private
#   def _params
#     params.permit(:)
#   end
end