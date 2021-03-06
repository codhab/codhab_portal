module Main
  module ApplicationHelper
    def slider_each(limit = 10, order = 'DESC')
      @slider = Main::Post.where(slider: true ,publish: true).limit(limit).order("created_at #{order}")

      @slider.each_with_index do |s|
        yield s
      end
    end

    def link_to_nav(nav)
      if nav.pagina? && nav.link_page.present?
        link_to nav.name, main.page_path(nav.link_page), target: nav.target
      else
        link_to nav.name, nav.link_external, target: nav.target
      end
    end

    def link_each(category, order = 'ASC')
      @category = Main::NavCategory.find_by_name(category)
      if @category.present? && @category.navs.present?
        @category.navs.active.order(:order).each do |n|
          yield n
        end
      end
    end

    def batata(categories)
      @sliderss = categories
      if @sliderss == 'habitação'
          @sliderss = 'habitacao'
      elsif @sliderss == 'regularização'
          @sliderss = 'regularizacao'
      else
        @sliderss = categories
      end

        yield @sliderrs
    end

    def post_each(limit = 10, order = 'ASC')
      @posts = Main::Post.where(publish: true, slider: false, local_post: 1).limit(limit).order("id DESC")

      @posts.each do |p|
        yield p
      end
    end

    def video_each(limit = 10)
      @videos = Main::Video.where(publish: true).limit(limit).order(:position)

      @videos.each do |v|
        yield v
      end
    end

  end
end
