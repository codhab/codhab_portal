require_dependency 'social_work/application_controller'

module SocialWork
  class DocumentUploadsController < ApplicationController
    before_action :set_candidate
    before_action :set_document_upload, only: [:show, :update, :edit, :destroy]

    has_scope :by_type

    def index
      respond_to do |format|
        format.json {
          @documents = apply_scopes(Core::SocialWork::DocumentCategory.where.not(id: @candidate.document_uploads.map(&:document_category_id))).all
        }
      end
    end

    def new
      @document_upload = @candidate.document_uploads.new
    end

    def create
      @document_upload = @candidate.document_uploads.new(set_params)
      @document_upload.candidate_project_id = @candidate.candidate_projects.last.id
      @document_upload.user_id = current_social_user.id
      if @document_upload.save
        redirect_to candidate_path(@candidate)
      else
        render action: 'new'
      end
    end

    def finalize_document
      @step = Core::SocialWork::StepService.new
      @step.create_step!(7,@candidate.candidate_projects.last.id, "Atualização de documentos.")
      redirect_to candidate_path(@candidate)
    end

    def update
      if @document_upload.update(set_params)
        flash[:success] = t :success
        redirect_to action: 'index'
      else
        render action: 'edit'
      end
    end

    def destroy
      @document_upload.destroy
      flash[:success] =  t :success
      redirect_to action: :index
    end

    private


    def set_candidate
      @candidate = Core::SocialWork::Candidate.find(params[:candidate_id])
    end

    def set_params
      params.require(:social_work_document_upload).permit(:document,:project_id,:candidate_id,:document_category_id)
    end

    def set_document_upload
      @document_upload = @candidate.document_uploads.find(params[:id])
    end

  end
end
