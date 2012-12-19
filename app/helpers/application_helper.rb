# -*- encoding : utf-8 -*-
module ApplicationHelper
  def render_notice
    if flash[:notice]
      content_tag(:div,  flash[:notice], :class => "message notice")
    end
  end

  def render_warning
    if flash[:warning]
      content_tag(:div,  flash[:alert], :class => "message alert")
    end
  end
end
