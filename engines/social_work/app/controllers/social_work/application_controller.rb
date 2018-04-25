require_dependency 'application_controller'

module SocialWork
  class ApplicationController < ::ApplicationController

    layout 'application'

    before_action :authenticate_social_user!
  end
end
