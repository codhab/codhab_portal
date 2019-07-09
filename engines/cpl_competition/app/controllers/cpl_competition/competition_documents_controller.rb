module CplCompetition
  class CompetitionDocumentsController < ApplicationController
    before_action :set_competition
    before_action :set_competitions

    def index;end
    
    def new
      @document = @competition.competition_documents.new
    end 
    
    def create
      @document = @competition.competition_documents.new(set_params)
      @document.user_id = current_user.id
      @document.save
    end
    
    def edit; end
    
    def update
      @document.user_id = current_user.id
      
      if @document.update(set_params)
        redirect_to action: :index
      else
        render action: :edit
      end

    end

    def destroy
    end

    private

    def set_competitions
      @documents = @competition.competition_documents
    end

    def set_competition
      @competition = CplCompetition::Competition.find(params[:competition_id])
    end

    def set_params
      params.require(:competition_document).permit(:name, :status)
    end
    
  end
end