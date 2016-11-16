module ApplicationHelper
  def site_title(page_title = '')
    base_title = "Reading List App"
    page_title.present? ? page_title + ' | ' + base_title : base_title
  end
end
