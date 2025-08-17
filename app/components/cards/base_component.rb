# frozen_string_literal: true

class Cards::BaseComponent < ViewComponent::Base
  # Base component for all card-related components
  # Provides common functionality and styling for cards

  attr_reader :variant, :padding, :shadow, :rounded

  def initialize(variant: :default, padding: :default, shadow: :default, rounded: :default)
    @variant = variant
    @padding = padding
    @shadow = shadow
    @rounded = rounded
  end

  private

  def base_card_classes
    [
      "bg-white",
      padding_classes,
      shadow_classes,
      rounded_classes,
      variant_classes
    ].compact.join(" ")
  end

  def padding_classes
    case padding
    when :none then ""
    when :sm then "p-4"
    when :lg then "p-8"
    else "p-6" # default
    end
  end

  def shadow_classes
    case shadow
    when :none then ""
    when :sm then "shadow-sm"
    when :lg then "shadow-lg"
    when :xl then "shadow-xl"
    else "shadow" # default
    end
  end

  def rounded_classes
    case rounded
    when :none then ""
    when :sm then "rounded-sm"
    when :lg then "rounded-lg"
    when :xl then "rounded-xl"
    else "rounded-md" # default
    end
  end

  def variant_classes
    case variant
    when :bordered then "border border-gray-200"
    when :elevated then "ring-1 ring-gray-900/5"
    else "" # default
    end
  end
end
