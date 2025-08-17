# frozen_string_literal: true

class Navigation::Topnav::ProfileDropdownComponent < ViewComponent::Base
  def initialize(user_name: "Tom Cook", user_email: "tom@example.com", avatar_src: nil, menu_items: default_menu_items)
    @user_name = user_name
    @user_email = user_email
    @avatar_src = avatar_src || "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
    @menu_items = menu_items
  end

  private

  attr_reader :user_name, :user_email, :avatar_src, :menu_items

  def default_menu_items
    [
      { name: "Your profile", href: "#" },
      { name: "Settings", href: "#" },
      { name: "Sign out", href: "#" }
    ]
  end
end
