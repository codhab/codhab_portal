module Candidate
  module ExternalAttendance
    class Session
      include ActiveModel::Model 

      attr_accessor :cpf, :password, :attendant

      validates :cpf, cpf: true, presence: true 
      validates :password, presence: true, length: { minimum: 6}
      validate  :cpf_is_allow?

      def authenticate(session)
        return false if invalid?

        session[:external_attendance_user_id] = @attendant.id

        true
      end

      private

      def cpf_is_allow?
        @attendant = Candidate::ExternalAttendance::User.find_by(cpf: self.cpf)

        if @attendant.nil? || (BCrypt::Password.new(@attendant.password_digest) != self.password )
          errors.add(:cpf, "ou senha não conferem")
        end
      end

    end
  end
end