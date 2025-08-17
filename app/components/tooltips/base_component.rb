# frozen_string_literal: true

class Tooltips::BaseComponent < ViewComponent::Base
  # Base component for all tooltip-related components
  # Provides common functionality and styling for tooltips

  attr_reader :text, :position, :trigger, :variant, :size, :delay, :arrow, :tooltip_id

  def initialize(
    text:,
    position: :top,
    trigger: :hover,
    variant: :dark,
    size: :default,
    delay: 0,
    arrow: true,
    tooltip_id: nil,
    **options
  )
    @text = text
    @position = position
    @trigger = trigger
    @variant = variant
    @size = size
    @delay = delay
    @arrow = arrow
    @tooltip_id = tooltip_id || "tooltip_#{SecureRandom.hex(4)}"
    @options = options
  end

  private

  def tooltip_classes
    [
      "absolute z-50 px-2 py-1 text-sm transition-opacity duration-200",
      "opacity-0 pointer-events-none",
      variant_classes,
      size_classes,
      position_classes
    ].compact.join(" ")
  end

  def variant_classes
    case variant
    when :dark
      "bg-gray-900 text-white rounded"
    when :light
      "bg-white text-gray-900 border border-gray-200 shadow-lg rounded"
    when :primary
      "bg-indigo-600 text-white rounded"
    when :success
      "bg-green-600 text-white rounded"
    when :warning
      "bg-yellow-600 text-white rounded"
    when :error, :danger
      "bg-red-600 text-white rounded"
    when :info
      "bg-blue-600 text-white rounded"
    else
      "bg-gray-900 text-white rounded" # default (dark)
    end
  end

  def size_classes
    case size
    when :sm
      "px-1.5 py-0.5 text-xs"
    when :lg
      "px-3 py-1.5 text-base"
    else
      "px-2 py-1 text-sm" # default
    end
  end

  def position_classes
    case position
    when :top
      "bottom-full left-1/2 transform -translate-x-1/2 mb-1"
    when :bottom
      "top-full left-1/2 transform -translate-x-1/2 mt-1"
    when :left
      "right-full top-1/2 transform -translate-y-1/2 mr-1"
    when :right
      "left-full top-1/2 transform -translate-y-1/2 ml-1"
    when :top_left, :top_start
      "bottom-full left-0 mb-1"
    when :top_right, :top_end
      "bottom-full right-0 mb-1"
    when :bottom_left, :bottom_start
      "top-full left-0 mt-1"
    when :bottom_right, :bottom_end
      "top-full right-0 mt-1"
    else
      "bottom-full left-1/2 transform -translate-x-1/2 mb-1" # default (top)
    end
  end

  def arrow_classes
    return "" unless arrow

    base_arrow = "absolute w-0 h-0"

    case variant
    when :light
      border_color = "border-gray-200"
      bg_color = "border-white"
    when :primary
      border_color = "border-indigo-600"
      bg_color = "border-indigo-600"
    when :success
      border_color = "border-green-600"
      bg_color = "border-green-600"
    when :warning
      border_color = "border-yellow-600"
      bg_color = "border-yellow-600"
    when :error, :danger
      border_color = "border-red-600"
      bg_color = "border-red-600"
    when :info
      border_color = "border-blue-600"
      bg_color = "border-blue-600"
    else
      border_color = "border-gray-900"
      bg_color = "border-gray-900"
    end

    case position
    when :top, :top_left, :top_right
      "#{base_arrow} top-full left-1/2 transform -translate-x-1/2 border-l-4 border-r-4 border-t-4 border-transparent border-t-current"
    when :bottom, :bottom_left, :bottom_right
      "#{base_arrow} bottom-full left-1/2 transform -translate-x-1/2 border-l-4 border-r-4 border-b-4 border-transparent border-b-current"
    when :left
      "#{base_arrow} right-full top-1/2 transform -translate-y-1/2 border-t-4 border-b-4 border-l-4 border-transparent border-l-current"
    when :right
      "#{base_arrow} left-full top-1/2 transform -translate-y-1/2 border-t-4 border-b-4 border-r-4 border-transparent border-r-current"
    else
      "#{base_arrow} top-full left-1/2 transform -translate-x-1/2 border-l-4 border-r-4 border-t-4 border-transparent border-t-current"
    end
  end

  def trigger_data_attributes
    case trigger
    when :hover
      {
        action: "mouseenter->tooltip#show mouseleave->tooltip#hide",
        tooltip_delay_value: delay
      }
    when :click
      {
        action: "click->tooltip#toggle",
        tooltip_delay_value: delay
      }
    when :focus
      {
        action: "focus->tooltip#show blur->tooltip#hide",
        tooltip_delay_value: delay
      }
    else
      {
        action: "mouseenter->tooltip#show mouseleave->tooltip#hide",
        tooltip_delay_value: delay
      }
    end
  end

  def wrapper_attributes
    attrs = @options.dup
    attrs[:class] = [ attrs[:class], "relative inline-block" ].compact.join(" ")
    attrs[:data] ||= {}
    attrs[:data].merge!(trigger_data_attributes)
    attrs[:data][:tooltip_target] = "wrapper"
    attrs
  end

  def tooltip_attributes
    {
      id: tooltip_id,
      role: "tooltip",
      class: tooltip_classes,
      data: {
        tooltip_target: "tooltip"
      }
    }
  end
end
