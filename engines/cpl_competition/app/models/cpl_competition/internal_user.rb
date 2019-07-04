module CplCompetition
  class InternalUser < CplCompetition::User
    default_scope { where(administrator: true)}

  end
end