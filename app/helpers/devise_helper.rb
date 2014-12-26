module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?
    messages = resource.errors.full_messages.map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-success alert-dismissable" role="alert">
    <button type="button" class="close" data-dismiss="alert">
      <span aria-hidden="true">&times;</span><span class="sr-only"></span></button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
end