module ApplicationHelper
  def page_title(title = '')
    base_title = 'LISTENER 2.0'
    title.present? ? "#{title} | #{base_title}" : base_title
  end

end
