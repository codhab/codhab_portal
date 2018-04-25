module Firm
  module Api
    class ApiController < ActionController::Base

      before_action :authenticate_token!

      helper_method :current_company
      helper_method :access_is_valid?

      private

      def current_company
        ::Firm::Company.find_by(token: params[:token_id]) rescue nil
      end

      def authenticate_token!
        if !current_company.present? || current_company.token_expires_in < Time.now
          render nothing: true, status: :unauthorized 
        end
      end
      
    end
  end
end