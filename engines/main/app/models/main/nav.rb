module Main
  class Nav < ActiveRecord::Base
    self.table_name = 'portal.main_navs'

    belongs_to :link_page, class_name: "Main::Page"
    belongs_to :link_post, class_name: "Main::Post"

    enum :type_nav => [:pagina, :post, :externo]
    enum :target   => [:_blank, :_self]

    scope :active, -> {where(publish: true)}
    scope :by_title, -> (title) { where("name ILIKE concat('%', ?, '%')", title)}
    scope :by_category, -> (category) { where(category_id: category)}
    scope :by_publish,  -> (publish) { where(publish: publish)}


  end
end
