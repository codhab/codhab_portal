require_dependency 'application_helper'
module Mobilization

  class HomeController < ApplicationController
    def index
      @sliders = Slider.all
      @events = Event.all
    end
  end
end
