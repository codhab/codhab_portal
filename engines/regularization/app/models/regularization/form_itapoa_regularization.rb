module Regularization
  class FormItapoaRegularization < ActiveRecord::Base
    self.table_name = 'offboardx.form_itapoa_regularizations'

    attr_accessor :terms_use

    validates :cpf, cpf: true, presence: true
    
  end
end