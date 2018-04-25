module Document
  class Allotment < ApplicationRecord
    belongs_to :template
    belongs_to :staff

    has_many :data_prints
  end
end
