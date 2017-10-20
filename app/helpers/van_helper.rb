module VanHelper

  def van_feature_tags(tags_string)
    tag_array = tags_string.split(',')
    tag_array.map do |tag|
      content_tag(:div, tag, class: 'feature-tag')
    end.join(' ').html_safe
  end
end