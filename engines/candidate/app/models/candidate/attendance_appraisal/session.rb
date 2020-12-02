module Candidate
  module AttendanceAppraisal
    class Session
      include ActiveModel::Model 

      attr_accessor :username, :password, :attendant
      
      validates :username, presence: true 
      validates :password, presence: true, length: { minimum: 6}
      validate  :username_is_allow?

      def authenticate(session)
        return false if invalid?

        session[:external_medical_attendance_user_id] = @attendant.id

        true
      end

      private

      def username_is_allow?
        @attendant = ::Candidate::ExternalAttendance::User.find_by(cpf: self.username)

        if @attendant.nil? || (::BCrypt::Password.new(@attendant.password_digest) != self.password )
          errors.add(:username, "ou senha não conferem")
        end
      end

    end
  end
end