ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.gsub('<br>', '').html_safe
end