module Main
  class BrasiliaHabitationController < ApplicationController

    def index
       @results = Main::Brasilia_Habitation.all.limit(1).order(created_at: 'DESC')
    end

  end
end
