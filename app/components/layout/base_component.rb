# frozen_string_literal: true

class Layout::BaseComponent < ViewComponent::Base
  # Base component for all layout-related components
  # Provides common functionality and styling for layout elements

  attr_reader :container, :padding, :margin, :background

  def initialize(container: true, padding: :default, margin: :none, background: :default)
    @container = container
    @padding = padding
    @margin = margin
    @background = background
  end

  private

  def base_layout_classes
    [
      container_classes,
      padding_classes,
      margin_classes,
      background_classes
    ].compact.join(" ")
  end

  def container_classes
    case container
    when true then "container mx-auto"
    when :fluid then "w-full"
    when :narrow then "container mx-auto max-w-4xl"
    when :wide then "container mx-auto max-w-7xl"
    else ""
    end
  end

  def padding_classes
    case padding
    when :none then ""
    when :sm then "p-4"
    when :lg then "p-8"
    when :xl then "p-12"
    when :x then "px-4 sm:px-6 lg:px-8"
    when :y then "py-4 sm:py-6 lg:py-8"
    else "p-6" # default
    end
  end

  def margin_classes
    case margin
    when :none then ""
    when :sm then "m-4"
    when :lg then "m-8"
    when :xl then "m-12"
    when :x then "mx-4 sm:mx-6 lg:mx-8"
    when :y then "my-4 sm:my-6 lg:my-8"
    when :auto then "mx-auto"
    else ""
    end
  end

  def background_classes
    case background
    when :none then ""
    when :gray then "bg-gray-50"
    when :white then "bg-white"
    when :dark then "bg-gray-900"
    when :primary then "bg-indigo-50"
    else "" # default
    end
  end

  def section_classes
    "w-full"
  end

  def grid_classes(cols: 1, gap: :default)
    gap_class = case gap
    when :none then "gap-0"
    when :sm then "gap-4"
    when :lg then "gap-8"
    when :xl then "gap-12"
    else "gap-6" # default
    end

    "grid grid-cols-1 #{gap_class} sm:grid-cols-#{[ cols, 2 ].min} lg:grid-cols-#{cols}"
  end

  def flex_classes(direction: :row, justify: :start, align: :start, wrap: false)
    [
      "flex",
      "flex-#{direction}",
      "justify-#{justify}",
      "items-#{align}",
      wrap ? "flex-wrap" : "flex-nowrap"
    ].join(" ")
  end
end
