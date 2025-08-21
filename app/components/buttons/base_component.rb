# frozen_string_literal: true

class Buttons::BaseComponent < ViewComponent::Base
  # Base component for all button-related components
  # Provides common functionality and styling for buttons
  include LucideRails::RailsHelper

  attr_reader :variant, :size, :disabled, :type, :href, :target, :method, :form, :icon, :label

  def initialize(
    label: nil,
    icon: nil,
    variant: :primary,
    size: :default,
    disabled: false,
    type: "button",
    href: nil,
    target: nil,
    method: nil,
    form: nil,
    **options
  )
    @label = label
    @icon = icon
    @variant = variant
    @size = size
    @disabled = disabled
    @type = type
    @href = href
    @target = target
    @method = method
    @form = form
    @options = options
  end

  private

  def tag_name
    href ? :a : :button
  end

  def base_button_classes
    [
      "inline-flex items-center justify-center font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50",
      variant_classes,
      size_classes,
      disabled_classes
    ].compact.join(" ")
  end

  def variant_classes
    case variant
    when :primary
      "bg-indigo-600 text-white hover:bg-indigo-500 focus-visible:ring-indigo-600"
    when :secondary
      "bg-white text-gray-900 ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
    when :destructive
      "bg-red-600 text-white hover:bg-red-500 focus-visible:ring-red-600"
    when :outline
      "border border-gray-300 bg-white text-gray-700 hover:bg-gray-50 focus-visible:ring-indigo-600"
    when :ghost
      "text-gray-700 hover:bg-gray-100 focus-visible:ring-indigo-600"
    when :link
      "text-indigo-600 underline-offset-4 hover:underline focus-visible:ring-indigo-600"
    else
      "bg-indigo-600 text-white hover:bg-indigo-500 focus-visible:ring-indigo-600"
    end
  end

  def size_classes
    case size
    when :sm
      "h-8 rounded-md px-3 text-sm"
    when :lg
      "h-12 rounded-md px-8 text-lg"
    when :icon
      "h-10 w-10 rounded-md"
    else
      "h-10 rounded-md px-4 py-2 text-sm" # default
    end
  end

  def disabled_classes
    disabled ? "opacity-50 cursor-not-allowed" : ""
  end

  def button_attributes
    attrs = @options.dup

    if href
      attrs[:href] = href
      attrs[:target] = target if target
      attrs[:data] = { method: method } if method
    else
      attrs[:type] = type
      attrs[:disabled] = disabled if disabled
      attrs[:form] = form if form
    end

    attrs[:class] = [ attrs[:class], base_button_classes ].compact.join(" ")
    attrs
  end
end
