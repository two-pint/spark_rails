# frozen_string_literal: true

class Modals::BaseComponent < ViewComponent::Base
  # Base component for all modal-related components
  # Provides common functionality and styling for modals

  attr_reader :size, :closable, :backdrop_closable, :modal_id

  def initialize(size: :default, closable: true, backdrop_closable: true, modal_id: nil)
    @size = size
    @closable = closable
    @backdrop_closable = backdrop_closable
    @modal_id = modal_id || "modal_#{SecureRandom.hex(4)}"
  end

  private

  def overlay_classes
    "fixed inset-0 bg-gray-500 bg-opacity-75 transition-opacity"
  end

  def modal_container_classes
    "fixed inset-0 z-10 w-screen overflow-y-auto"
  end

  def modal_wrapper_classes
    "flex min-h-full items-end justify-center p-4 text-center sm:items-center sm:p-0"
  end

  def modal_panel_classes
    [
      "relative transform overflow-hidden rounded-lg bg-white text-left shadow-xl transition-all",
      size_classes
    ].compact.join(" ")
  end

  def size_classes
    case size
    when :sm then "sm:my-8 sm:w-full sm:max-w-sm"
    when :lg then "sm:my-8 sm:w-full sm:max-w-2xl"
    when :xl then "sm:my-8 sm:w-full sm:max-w-4xl"
    when :full then "sm:my-8 sm:w-full sm:max-w-6xl"
    else "sm:my-8 sm:w-full sm:max-w-lg" # default
    end
  end

  def close_button_classes
    "absolute right-0 top-0 hidden pr-4 pt-4 sm:block"
  end

  def close_icon_classes
    "h-6 w-6 text-gray-400 hover:text-gray-500"
  end

  def backdrop_attrs
    backdrop_closable ? { data: { action: "click->modal#close" } } : {}
  end
end
