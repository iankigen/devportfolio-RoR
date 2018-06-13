module ApplicationHelper
  def login_helper style
    if current_user.is_a?(GuestUser)
      "#{link_to 'Login', new_user_session_path, class: style}
      #{link_to 'Register', new_user_registration_path, class: style}".html_safe
    else
      "#{link_to "Logout", destroy_user_session_path, method: :delete, class: style}".html_safe
    end
  end

  def source_helper
    if session[:source]
      msg = "Thanks for visiting me from #{session[:source]}"
      content_tag(:p, msg, class: 'source-greeting')

    end
  end

  def copyright
    "&copy; #{Time.now.year} | <b>Ian Kigen</b> All rights reserved".html_safe
  end
end
