# frozen_string_literal: true

class Navigation::Topnav::PageHeaderComponent < ViewComponent::Base
  def initialize(title: "Dashboard", subtitle: nil, max_width: "max-w-7xl")
    @title = title
    @subtitle = subtitle
    @max_width = max_width
  end

  private

  attr_reader :title, :subtitle, :max_width
end
