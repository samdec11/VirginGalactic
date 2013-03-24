module ApplicationHelper
  def login_nav
    nav = ""

    if @auth.present?

      if @auth.is_admin?
        nav += "<li>#{link_to('Planes', planes_path, :class => 'button radius alert')}</li>"
        nav += "<li>#{link_to('Flights', flights_path, :class => 'button radius alert')}</li>"
        nav += "<li>#{link_to(@auth.email, login_path, :method => :delete, :class => 'button radius alert')}</li>"

      else
        nav += "<li>#{link_to('Search', search_path, :class => 'button radius alert')}</li>"
        nav += "<li>#{link_to(@auth.email, login_path, :method => :delete, :class => 'button radius alert')}</li>"
      end
    end
  end
end