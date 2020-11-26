module Regularization
  class MestreDarmasRegularizationSession
    include ActiveModel::Model
  
    attr_accessor :username, :password, :id, :mestre_darmas_user

    validates :username, :password, presence: true
    validate :user_authenticate!

    def authenticate(session)
      return false if invalid?

      session[:mestre_darmas_user_id] = @mestre_darmas_user.id

      true
    end

    private

    def user_authenticate!
      @mestre_darmas_user = ::Candidate::ExternalAttendance::User.find_by(cpf: self.username)
      
      if @mestre_darmas_user.nil? || (::BCrypt::Password.new(@mestre_darmas_user.password_digest) != self.password)
        errors.add(:username, "ou senha não conferem")
      end
    end

  end
end