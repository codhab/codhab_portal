module Regularization
  class FormItapoaRegularization < ActiveRecord::Base
    self.table_name = 'offboardx.form_itapoa_regularizations'


    validates :cpf, cpf: true, presence: true
    
  end
end