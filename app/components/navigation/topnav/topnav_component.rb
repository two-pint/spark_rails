# frozen_string_literal: true

class Navigation::Topnav::TopnavComponent < ViewComponent::Base
  def initialize(
    logo_src: nil,
    nav_links: nil,
    user_name: "Tom Cook",
    user_email: "tom@example.com",
    avatar_src: nil,
    page_title: "Dashboard",
    page_subtitle: nil
  )
    @logo_src = logo_src
    @nav_links = nav_links
    @user_name = user_name
    @user_email = user_email
    @avatar_src = avatar_src
    @page_title = page_title
    @page_subtitle = page_subtitle
  end

  private

  attr_reader :logo_src, :nav_links, :user_name, :user_email, :avatar_src, :page_title, :page_subtitle
end
