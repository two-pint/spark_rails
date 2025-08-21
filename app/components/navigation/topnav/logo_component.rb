# frozen_string_literal: true

class Navigation::Topnav::LogoComponent < ViewComponent::Base
  include InlineSvg::ActionView::Helpers

  def initialize(src: nil, alt: "Your Company", classes: "h-8 w-auto")
    @src = src || "spark_logo.svg"
    @alt = alt
    @classes = classes
  end

  private

  attr_reader :src, :alt, :classes
end
