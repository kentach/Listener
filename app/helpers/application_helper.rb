module ApplicationHelper
  def page_title(title = "")
    base_title = "LISTENER 2.0"
    title.present? ? "#{title} | #{base_title}" : base_title
  end

  def hide_header?
    (controller_name == "sessions" && action_name == "new") ||
    (controller_name == "registrations" && action_name == "new") ||
    (controller_name == "audios" && action_name == "show")
  end
end
