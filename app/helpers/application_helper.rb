module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      "<li> #{link_to "Logout", destroy_user_session_path, method: :delete} </li>".html_safe
    else
      "<li>#{link_to 'Login', new_user_session_path}</li>
      <li>#{link_to 'Register', new_user_registration_path}</li>".html_safe
    end
  end

  def source_helper
    if session[:source]
      msg = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, msg, class: 'source-greeting')

    end
  end
end
