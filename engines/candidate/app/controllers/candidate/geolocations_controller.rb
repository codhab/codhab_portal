
require 'json'
require_dependency 'candidate/application_controller'

module Candidate
  class GeolocationsController < ApplicationController

    def candidates_zone_one
      @candidates = apply_scopes(::Candidate::CandidateMap).where.not('lat is null')
      
      respond_to do |format|
        format.json {
          @candidates
        }

        format.js {
          @candidates
        }

        format.html {}
      end
    end

  end
end