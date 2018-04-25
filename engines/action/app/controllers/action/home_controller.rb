require_dependency 'application_helper'
module Action

  class HomeController < ApplicationController
    def index
      @events_i = Action::SocialEvent.where(situation:'2',status:true).limit(3).order(date: 'ASC')
      @events_c = Action::SocialEvent.where(situation:'0',status: true).limit(3).order(date: 'DESC')
      @action_sliders = Main::ActionSlider.where(status:true).order(order: :desc)
      @links_general = Action::GeneralLink.all.limit(1).order(created_at: 'DESC')
      @links_team = Action::TeamLink.all.limit(1).order(created_at: 'DESC')
      @links_yearly = Action::YearlyLink.all.limit(1).order(created_at: 'DESC')
    end

    def done_action
      @events = Action::SocialEvent.where(situation:'0',status: true).order(date: 'DESC')
    end

    def cadastro
    end

    def galeria
      @galerias = Main::Post.where(post_category:'10').order(created_at: :desc)
    end
  end
end
