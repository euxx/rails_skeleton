module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'A concise sentence with keywords under 70 characters'
    page_title.empty? ? base_title : "#{page_title} - #{base_title}"
  end

  def icon(style, name, text = nil, html_options = {})
    text, html_options = nil, text if text.is_a?(Hash)

    content_class = "#{style} fa-#{name}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class

    html = content_tag(:i, nil, html_options)
    text.blank? ? html : html << ' ' << text.to_s
  end
end
