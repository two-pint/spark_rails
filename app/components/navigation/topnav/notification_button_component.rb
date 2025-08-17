# frozen_string_literal: true

class Navigation::Topnav::NotificationButtonComponent < ViewComponent::Base
  def initialize(classes: default_classes, sr_text: "View notifications")
    @classes = classes
    @sr_text = sr_text
  end

  private

  attr_reader :classes, :sr_text

  def default_classes
    "relative rounded-full p-1 text-gray-400 hover:text-gray-500 focus:outline-2 focus:outline-offset-2 focus:outline-indigo-600"
  end
end
