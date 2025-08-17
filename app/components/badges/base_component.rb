# frozen_string_literal: true

class Badges::BaseComponent < ViewComponent::Base
  # Base component for all badge-related components
  # Provides common functionality and styling for badges

  attr_reader :variant, :size, :rounded, :removable, :href, :target

  def initialize(
    variant: :default,
    size: :default,
    rounded: :default,
    removable: false,
    href: nil,
    target: nil,
    **options
  )
    @variant = variant
    @size = size
    @rounded = rounded
    @removable = removable
    @href = href
    @target = target
    @options = options
  end

  private

  def tag_name
    href ? :a : :span
  end

  def base_badge_classes
    [
      "inline-flex items-center font-medium transition-colors",
      variant_classes,
      size_classes,
      rounded_classes
    ].compact.join(" ")
  end

  def variant_classes
    case variant
    when :primary
      "bg-indigo-100 text-indigo-800 hover:bg-indigo-200"
    when :secondary
      "bg-gray-100 text-gray-800 hover:bg-gray-200"
    when :success
      "bg-green-100 text-green-800 hover:bg-green-200"
    when :warning
      "bg-yellow-100 text-yellow-800 hover:bg-yellow-200"
    when :error, :danger
      "bg-red-100 text-red-800 hover:bg-red-200"
    when :info
      "bg-blue-100 text-blue-800 hover:bg-blue-200"
    when :outline
      "border border-gray-300 text-gray-700 hover:bg-gray-50"
    when :solid_primary
      "bg-indigo-600 text-white hover:bg-indigo-700"
    when :solid_secondary
      "bg-gray-600 text-white hover:bg-gray-700"
    when :solid_success
      "bg-green-600 text-white hover:bg-green-700"
    when :solid_warning
      "bg-yellow-600 text-white hover:bg-yellow-700"
    when :solid_error, :solid_danger
      "bg-red-600 text-white hover:bg-red-700"
    when :solid_info
      "bg-blue-600 text-white hover:bg-blue-700"
    else
      "bg-gray-100 text-gray-800 hover:bg-gray-200" # default
    end
  end

  def size_classes
    case size
    when :sm
      "px-2 py-0.5 text-xs"
    when :lg
      "px-3 py-1 text-sm"
    when :xl
      "px-4 py-1.5 text-base"
    else
      "px-2.5 py-0.5 text-sm" # default
    end
  end

  def rounded_classes
    case rounded
    when :none
      ""
    when :sm
      "rounded-sm"
    when :lg
      "rounded-lg"
    when :full
      "rounded-full"
    else
      "rounded" # default
    end
  end

  def badge_attributes
    attrs = @options.dup

    if href
      attrs[:href] = href
      attrs[:target] = target if target
    end

    attrs[:class] = [ attrs[:class], base_badge_classes ].compact.join(" ")
    attrs
  end

  def remove_button_classes
    case variant
    when :solid_primary, :solid_secondary, :solid_success, :solid_warning, :solid_error, :solid_danger, :solid_info
      "ml-1.5 -mr-0.5 h-3 w-3 text-white/70 hover:text-white"
    else
      "ml-1.5 -mr-0.5 h-3 w-3 text-current/70 hover:text-current"
    end
  end

  def dot_classes
    case variant
    when :primary
      "bg-indigo-500"
    when :success
      "bg-green-500"
    when :warning
      "bg-yellow-500"
    when :error, :danger
      "bg-red-500"
    when :info
      "bg-blue-500"
    when :solid_primary
      "bg-indigo-300"
    when :solid_success
      "bg-green-300"
    when :solid_warning
      "bg-yellow-300"
    when :solid_error, :solid_danger
      "bg-red-300"
    when :solid_info
      "bg-blue-300"
    else
      "bg-gray-500" # default and secondary
    end
  end
end
