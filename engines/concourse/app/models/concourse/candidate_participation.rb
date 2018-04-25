module Concourse
  class CandidateParticipation < ActiveRecord::Base
    belongs_to :candidate


    has_many  :team_participations, dependent: :destroy
    accepts_nested_attributes_for :team_participations, allow_destroy: true, reject_if: :all_blank

    validates :archive_one, :archive_two, :archive_three, presence: true

    validates :archive_one, file_content_type: { allow: ['application/pdf'],
                                                 message: 'Somente arquivos no formato PDF' },
                                                 file_size: {less_than_or_equal_to: 30.megabytes.to_i,
                                                 message: 'O arquivo excede o tamanho permitido'}


    validates :archive_two, file_content_type: { allow: ['application/pdf'],
                                                 message: 'Somente arquivos no formato PDF' },
                                                 file_size: {less_than_or_equal_to: 5.megabytes.to_i,
                                                 message: 'O arquivo excede o tamanho permitido'}


    validates :archive_three, file_content_type: { allow: ['image/png','image/jpg', 'image/jpeg'],
                                                  message: 'Somente arquivos no formato PNG ou JPG' },
                                                  file_size: {less_than_or_equal_to: 5.megabytes.to_i,
                                                  message: 'O arquivo excede o tamanho permitido'}


    mount_uploader :archive_one,   Concourse::FileUploader
    mount_uploader :archive_two,   Concourse::FileUploader
    mount_uploader :archive_three, Concourse::FileUploader
    mount_uploader :archive_four, Concourse::FileUploader
    mount_uploader :archive_five, Concourse::FileUploader
  end
end
