module ApplicationHelper
  def login_nav
    nav = ""

    if @auth.present?

      if @auth.is_admin?

        nav += "<li>#{link_to('Planes', planes_path, :class => 'button radius secondary nav')}</li>"
        nav += "<li>#{link_to('Flights', flights_path, :class => 'button radius secondary nav')}</li>"
        nav += "<li>#{link_to('Logout', login_path, :method => :delete, :class => 'button radius alert')}</li>"

      else
        nav += "<li>#{link_to('Search', search_path, :class => 'button radius secondary nav')}</li>"
        nav += "<li>#{link_to('Logout', login_path, :method => :delete, :class => 'button radius alert')}</li>"
      end
    end
  end

  def greeting
    links = ""
    if @auth.present?
      "<li id='greeting'>#{link_to('Welcome back' + ' | ' + @auth.name, '#', :id => 'greeting')}</li>"
    else
      links += ""
    end
  end
end