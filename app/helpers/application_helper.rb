module ApplicationHelper
  def login_nav
    nav = ""

    if @auth.present?

      if @auth.is_admin?
        nav += "<li>#{link_to('Planes', planes_path, :class => 'tab_fonts', :class => 'button radius')}</li>"
        nav += "<li>#{link_to('Flights', flights_path, :class => 'button radius')}</li>"
        nav += "<li>#{link_to(@auth.email, login_path, :method => :delete, :class => 'button radius')}</li>"

      else
        nav += "<li>#{link_to('Search', search_path, :class => 'button radius')}</li>"
        nav += "<li>#{link_to(@auth.email, login_path, :method => :delete, :class => 'button radius')}</li>"
      end
    end
  end
end