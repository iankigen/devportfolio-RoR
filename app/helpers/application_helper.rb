module ApplicationHelper
  def login_helper(style = 'nav-link')
    login = style
    register = style
    if active?(new_user_session_path)
      login += ' active'
    end
    if active?(new_user_registration_path)
      register += ' active'
    end
    if current_user.is_a?(GuestUser)
      "#{link_to 'Login', new_user_session_path, class: login}
      #{link_to 'Register', new_user_registration_path, class: register}".html_safe
    else
      (link_to 'Logout', destroy_user_session_path, method: :delete, class: style).to_s.html_safe
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

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: about_path,
        title: 'About Me'
      }
    ]
  end

  def nav_helper(style)
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a>"
    end
    nav_links.html_safe
  end

  def active?(path)
    'active' if current_page? path
  end
end
