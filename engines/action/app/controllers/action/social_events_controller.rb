require_dependency 'application_helper'
module Action

  class SocialEventsController < ApplicationController


    def show
      @event = Action::SocialEvent.find(params[:id])
    end
  end
end
