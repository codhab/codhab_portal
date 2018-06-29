module Main
  class TradingFloorParticipant < ActiveRecord::Base
    self.table_name =  'extranet.cpl_trading_floor_participants'

    belongs_to :trading_floor

    validates :email, :social_name,:phone, presence: true
    validates :cnpj, presence: true
    validates :cnpj, cnpj: true, if: 'self.cnpj.present? && self.cnpj.length == 14'
    validates :cnpj, cpf: true, if: 'self.cnpj.present? && self.cnpj.length == 11'
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :phone,  numericality: { only_integer: true }
    # mount_uploader :attachment, Main::FileUploader
  end
end
