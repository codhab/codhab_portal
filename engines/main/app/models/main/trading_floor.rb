module Main
  class TradingFloor < ActiveRecord::Base
    self.table_name =  'extranet.cpl_trading_floors'

    has_many :trading_floor_participants

    # mount_uploader :attachment, Main::FileUploader
  end
end
