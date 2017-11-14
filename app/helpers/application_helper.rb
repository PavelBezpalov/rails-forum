module ApplicationHelper
  def error_notice(obj, attr)
    if obj.errors.key?(attr)
      content_tag('div', obj.errors.messages[attr].join(', '), class: 'help-block text-danger')
    end
  end

  def show_login_header?
    hidden_paths = [login_path, registration_path]
    hidden_paths.all? { |path| !current_page?(path) }
  end
end
