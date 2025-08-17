# frozen_string_literal: true

class Navigation::Topnav::NavLinksComponent < ViewComponent::Base
  def initialize(links: default_links, current_path: nil)
    @links = links
    @current_path = current_path
  end

  private

  attr_reader :links, :current_path

  def default_links
    [
      { name: "Dashboard", href: "#", current: true },
      { name: "Team", href: "#", current: false },
      { name: "Projects", href: "#", current: false },
      { name: "Calendar", href: "#", current: false }
    ]
  end

  def link_classes(link)
    base_classes = "inline-flex items-center border-b-2 px-1 pt-1 text-sm font-medium"

    if link[:current]
      "#{base_classes} border-indigo-600 text-gray-900"
    else
      "#{base_classes} border-transparent text-gray-500 hover:border-gray-300 hover:text-gray-700"
    end
  end
end
