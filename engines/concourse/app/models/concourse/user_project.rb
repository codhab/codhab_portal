module Concourse
  class UserProject < ApplicationRecord
    belongs_to :project
  end
end
