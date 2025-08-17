# frozen_string_literal: true

class Cards::BaseComponentPreview < ViewComponent::Preview
  # Default card with basic content
  # @param content text "Card content"
  def default(content: "This is a basic card with default styling")
    render Cards::BaseComponent.new do
      content_tag(:div, content, class: "text-gray-900")
    end
  end

  # All card variants
  # @param variant select { choices: [default, bordered, elevated] }
  # @param padding select { choices: [none, sm, default, lg] }
  # @param shadow select { choices: [none, sm, default, lg, xl] }
  # @param rounded select { choices: [none, sm, default, lg, xl] }
  def variants(variant: :default, padding: :default, shadow: :default, rounded: :default)
    render Cards::BaseComponent.new(variant: variant, padding: padding, shadow: shadow, rounded: rounded) do
      content_tag(:div, class: "space-y-2") do
        safe_join([
          content_tag(:h3, "Card Title", class: "text-lg font-semibold text-gray-900"),
          content_tag(:p, "This is a card with variant: #{variant}, padding: #{padding}, shadow: #{shadow}, rounded: #{rounded}", class: "text-gray-600")
        ])
      end
    end
  end

  # User profile card
  def user_profile
    render Cards::BaseComponent.new(variant: :bordered, shadow: :sm) do
      content_tag(:div, class: "flex items-center space-x-4") do
        safe_join([
          content_tag(:img, "",
            src: "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80",
            alt: "User avatar",
            class: "h-12 w-12 rounded-full"
          ),
          content_tag(:div) do
            safe_join([
              content_tag(:h4, "John Doe", class: "text-lg font-semibold text-gray-900"),
              content_tag(:p, "Software Developer", class: "text-sm text-gray-600"),
              content_tag(:p, "john@example.com", class: "text-sm text-gray-500")
            ])
          end
        ])
      end
    end
  end

  # Product card
  def product_card
    render Cards::BaseComponent.new(variant: :elevated, shadow: :lg, rounded: :lg) do
      content_tag(:div, class: "space-y-4") do
        safe_join([
          content_tag(:img, "",
            src: "https://images.unsplash.com/photo-1560472354-b33ff0c44a43?ixlib=rb-4.0.3&auto=format&fit=crop&w=300&h=200&q=80",
            alt: "Product image",
            class: "w-full h-48 object-cover rounded-md"
          ),
          content_tag(:div) do
            safe_join([
              content_tag(:h3, "Awesome Product", class: "text-xl font-bold text-gray-900"),
              content_tag(:p, "This is an amazing product that will solve all your problems.", class: "text-gray-600"),
              content_tag(:div, class: "flex items-center justify-between") do
                safe_join([
                  content_tag(:span, "$99.99", class: "text-2xl font-bold text-indigo-600"),
                  content_tag(:button, "Add to Cart",
                    class: "bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-500 transition-colors"
                  )
                ])
              end
            ])
          end
        ])
      end
    end
  end

  # Notification card
  def notification
    render Cards::BaseComponent.new(variant: :bordered, padding: :sm, rounded: :lg) do
      content_tag(:div, class: "flex items-start space-x-3") do
        safe_join([
          content_tag(:div, class: "flex-shrink-0") do
            content_tag(:div, class: "h-3 w-3 rounded-full bg-green-400")
          end,
          content_tag(:div, class: "flex-1") do
            safe_join([
              content_tag(:p, "Your order has been shipped!", class: "text-sm font-medium text-gray-900"),
              content_tag(:p, "Track your package with ID: #12345", class: "text-sm text-gray-600"),
              content_tag(:p, "2 minutes ago", class: "text-xs text-gray-400 mt-1")
            ])
          end
        ])
      end
    end
  end

  # Grid of cards
  def grid_example
    content_tag(:div, class: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6") do
      safe_join([
        render(Cards::BaseComponent.new(variant: :default, shadow: :sm)) do
          content_tag(:div, class: "p-4") do
            safe_join([
              content_tag(:h3, "Card 1", class: "font-semibold text-gray-900"),
              content_tag(:p, "Default variant", class: "text-gray-600")
            ])
          end
        end,
        render(Cards::BaseComponent.new(variant: :bordered, shadow: :md)) do
          content_tag(:div, class: "p-4") do
            safe_join([
              content_tag(:h3, "Card 2", class: "font-semibold text-gray-900"),
              content_tag(:p, "Bordered variant", class: "text-gray-600")
            ])
          end
        end,
        render(Cards::BaseComponent.new(variant: :elevated, shadow: :lg)) do
          content_tag(:div, class: "p-4") do
            safe_join([
              content_tag(:h3, "Card 3", class: "font-semibold text-gray-900"),
              content_tag(:p, "Elevated variant", class: "text-gray-600")
            ])
          end
        end
      ])
    end
  end
end
