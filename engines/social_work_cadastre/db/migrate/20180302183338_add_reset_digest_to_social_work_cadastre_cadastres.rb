class AddResetDigestToSocialWorkCadastreCadastres < ActiveRecord::Migration[5.0]
  def change
    add_column :social_work_cadastre_cadastres, :reset_digest,      :string
    add_column :social_work_cadastre_cadastres, :reset_sent_at,     :datetime
    add_column :social_work_cadastre_cadastres, :activation_digest, :string
    add_column :social_work_cadastre_cadastres, :activated,         :boolean
    add_column :social_work_cadastre_cadastres, :activated_at,      :datetime
  end
end
