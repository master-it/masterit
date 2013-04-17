module ApplicationHelper
  def item(tag, name, path, link_options = {})
    options = {}
    options[:class] = :active if current_page?(path)
    link = link_to(name, path, link_options)
    content_tag(:li, link, options)
  end

  def model_item(tag, model, path, options = {})
    item(tag, model.model_name.human, path, options)
  end
  
  def union_item(tag, name, path, options ={})
    new_name = "#{content_tag(:i, '', class: 'icon-chevron-right')} #{name}".html_safe
    item(tag, new_name, path, options)
  end
  
end
