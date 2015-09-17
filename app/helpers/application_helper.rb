module ApplicationHelper
  def render_notice
    content_tag(:div,  flash[:notice], class: 'message notice') if flash[:notice]
  end

  def render_warning
    content_tag(:div,  flash[:alert], class: 'message alert') if flash[:warning]
  end
end
