module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Search clinics"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def sortable(column, title = nil)
	  title ||= column 
	  css_class = column == sort_column ? "current #{sort_direction}" : nil
	  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
	  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
end
  
end