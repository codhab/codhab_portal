module Concourse
  class Consult < ActiveRecord::Base
    belongs_to :project

    validates :content, presence: true

    scope :by_date, -> (date) { where('created_at::date = ?', Date.parse(date))}
    scope :by_responded, -> (responded) { where(responded: responded)}

  end
end
