require_dependency 'attendance/application_controller'

module Attendance
  class ProfilesController < ApplicationController

    def edit
      @profile = Core::Attendance::ProfileForm.find(current_cadastre.id)
    end

    def update
      @profile = Core::Attendance::ProfileForm.find(current_cadastre.id)

      if @profile.update(set_params)
        flash[:success] = t :success
        redirect_to action: :edit
      else
        render action: :edit
      end
    end

    private

    def set_params
      params.require(:attendance_profile_form).permit(:password, :password_confirmation, :avatar)
    end

  end
end