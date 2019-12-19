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
        if current_company.nil?
          render nothing: true, status: :unauthorized 
        end
      end
      
    end
  end
end