# frozen_string_literal: true

class Forms::BaseComponent < ViewComponent::Base
  # Base component for all form-related components
  # Provides common functionality and styling for forms

  private

  def base_form_classes
    "space-y-6"
  end

  def input_classes
    "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
  end

  def label_classes
    "block text-sm font-medium leading-6 text-gray-900"
  end

  def button_classes
    "flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
  end

  def error_classes
    "mt-2 text-sm text-red-600"
  end
end
