# frozen_string_literal: true

class Navigation::Topnav::LogoComponent < ViewComponent::Base
  def initialize(src: nil, alt: "Your Company", classes: "h-8 w-auto")
    @src = src || "https://tailwindcss.com/plus-assets/img/logos/mark.svg?color=indigo&shade=600"
    @alt = alt
    @classes = classes
  end

  private

  attr_reader :src, :alt, :classes
end
