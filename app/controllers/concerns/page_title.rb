module PageTitle

  extend ActiveSupport::Concern

  included do
    before_action :set_title
  end
  def set_title
    @page_title = 'Devportfolio'
    @seo_content = 'Dev Portfolio & Blog'
  end
end