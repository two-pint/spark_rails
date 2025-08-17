# frozen_string_literal: true

class Navigation::Topnav::MobileMenuComponent < ViewComponent::Base
  def initialize(links: default_links, user_name: "Tom Cook", user_email: "tom@example.com", avatar_src: nil, profile_links: default_profile_links)
    @links = links
    @user_name = user_name
    @user_email = user_email
    @avatar_src = avatar_src || "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
    @profile_links = profile_links
  end

  private

  attr_reader :links, :user_name, :user_email, :avatar_src, :profile_links

  def default_links
    [
      { name: "Dashboard", href: "#", current: true },
      { name: "Team", href: "#", current: false },
      { name: "Projects", href: "#", current: false },
      { name: "Calendar", href: "#", current: false }
    ]
  end

  def default_profile_links
    [
      { name: "Your profile", href: "#" },
      { name: "Settings", href: "#" },
      { name: "Sign out", href: "#" }
    ]
  end

  def nav_link_classes(link)
    base_classes = "block border-l-4 py-2 pr-4 pl-3 text-base font-medium"

    if link[:current]
      "#{base_classes} border-indigo-600 bg-indigo-50 text-indigo-700"
    else
      "#{base_classes} border-transparent text-gray-600 hover:border-gray-300 hover:bg-gray-50 hover:text-gray-800"
    end
  end
end
