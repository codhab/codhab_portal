module Concourse
  class Project < ActiveRecord::Base

    extend FriendlyId

    friendly_id :title, use: :slugged

    scope :sliders, -> {where(slider: true)}
    scope :active, -> { where(status: true )}

    has_many :pages
    has_many :navs
    has_many :subscribes
    has_many :candidates, through: :subscribes
    has_many :candidate_participations, through: :candidates
    has_many :participations
    has_many :consults
    has_many :winners
    has_many :resources
    has_many :refunds, class_name: 'Concourse::CandidateRefund'

    enum step: ['desenvolvimento', 'previsto', 'aberto', 'finalizado']

    scope :waiting,     -> { where(step:[0,1], status: true) }
    scope :opens,       -> { where(step: 2) }
    scope :finisheds,   -> { where(step: 3) }

    mount_uploader :image_logo,   ImageUploader
    mount_uploader :image_header, ImageUploader
    mount_uploader :image_footer, ImageUploader
    mount_uploader :image_slider, ImageUploader
    mount_uploader :result_document, FileUploader

  end
end
