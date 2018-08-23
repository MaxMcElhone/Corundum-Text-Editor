module ApplicationHelper
  #a helper method to dynamically add the active class
  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

end
