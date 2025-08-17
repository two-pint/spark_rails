# frozen_string_literal: true

class Layout::BaseComponentPreview < ViewComponent::Preview
  # Default layout with basic content
  # @param content text "Layout content"
  def default(content: "This is a basic layout container")
    render Layout::BaseComponent.new do
      content_tag(:div, content, class: "text-gray-900 p-4 bg-gray-100 rounded")
    end
  end

  # All layout options
  # @param container select { choices: [true, false, fluid, narrow, wide] }
  # @param padding select { choices: [none, sm, default, lg, xl, x, y] }
  # @param margin select { choices: [none, sm, lg, xl, x, y, auto] }
  # @param background select { choices: [default, none, gray, white, dark, primary] }
  def options(container: true, padding: :default, margin: :none, background: :default)
    render Layout::BaseComponent.new(container: container, padding: padding, margin: margin, background: background) do
      content_tag(:div, class: "bg-white rounded p-4 shadow-sm") do
        safe_join([
          content_tag(:h3, "Layout Configuration", class: "text-lg font-semibold text-gray-900 mb-2"),
          content_tag(:ul, class: "text-sm text-gray-600 space-y-1") do
            safe_join([
              content_tag(:li, "Container: #{container}"),
              content_tag(:li, "Padding: #{padding}"),
              content_tag(:li, "Margin: #{margin}"),
              content_tag(:li, "Background: #{background}")
            ])
          end
        ])
      end
    end
  end

  # Container variants
  def containers
    content_tag(:div, class: "space-y-8") do
      safe_join([
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Container: true (default)", class: "text-lg font-semibold text-gray-900 mb-4"),
            render(Layout::BaseComponent.new(container: true, background: :gray)) do
              content_tag(:div, "Default container with max-width and auto margins", class: "bg-white p-4 rounded shadow-sm")
            end
          ])
        end,
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Container: fluid", class: "text-lg font-semibold text-gray-900 mb-4"),
            render(Layout::BaseComponent.new(container: :fluid, background: :gray)) do
              content_tag(:div, "Fluid container takes full width", class: "bg-white p-4 rounded shadow-sm")
            end
          ])
        end,
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Container: narrow", class: "text-lg font-semibold text-gray-900 mb-4"),
            render(Layout::BaseComponent.new(container: :narrow, background: :gray)) do
              content_tag(:div, "Narrow container with max-width 4xl", class: "bg-white p-4 rounded shadow-sm")
            end
          ])
        end,
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Container: wide", class: "text-lg font-semibold text-gray-900 mb-4"),
            render(Layout::BaseComponent.new(container: :wide, background: :gray)) do
              content_tag(:div, "Wide container with max-width 7xl", class: "bg-white p-4 rounded shadow-sm")
            end
          ])
        end
      ])
    end
  end

  # Padding variants
  def padding_variants
    content_tag(:div, class: "space-y-6") do
      safe_join([
        content_tag(:h3, "Padding Variants", class: "text-xl font-bold text-gray-900 mb-6"),
        content_tag(:div, class: "grid grid-cols-1 md:grid-cols-2 gap-6") do
          safe_join([
            [ :none, :sm, :default, :lg, :xl, :x, :y ].map do |padding|
              content_tag(:div) do
                safe_join([
                  content_tag(:h4, "Padding: #{padding}", class: "text-sm font-semibold text-gray-700 mb-2"),
                  render(Layout::BaseComponent.new(container: :narrow, padding: padding, background: :gray)) do
                    content_tag(:div, "Content with #{padding} padding", class: "bg-white rounded text-center text-sm")
                  end
                ])
              end
            end
          ].flatten)
        end
      ])
    end
  end

  # Background variants
  def backgrounds
    content_tag(:div, class: "space-y-6") do
      safe_join([
        content_tag(:h3, "Background Variants", class: "text-xl font-bold text-gray-900 mb-6"),
        content_tag(:div, class: "space-y-4") do
          safe_join([
            [ :default, :none, :gray, :white, :dark, :primary ].map do |background|
              content_tag(:div) do
                safe_join([
                  content_tag(:h4, "Background: #{background}", class: "text-sm font-semibold text-gray-700 mb-2"),
                  render(Layout::BaseComponent.new(container: :narrow, padding: :lg, background: background)) do
                    content_tag(:div, "Content with #{background} background",
                      class: background == :dark ? "text-white" : "text-gray-900"
                    )
                  end
                ])
              end
            end
          ].flatten)
        end
      ])
    end
  end

  # Two column layout example
  def two_column
    render Layout::BaseComponent.new(container: :wide, padding: :lg, background: :gray) do
      content_tag(:div, class: "grid grid-cols-1 lg:grid-cols-2 gap-8") do
        safe_join([
          content_tag(:div, class: "bg-white p-6 rounded-lg shadow-sm") do
            safe_join([
              content_tag(:h3, "Left Column", class: "text-lg font-semibold text-gray-900 mb-4"),
              content_tag(:p, "This is the left column content. It contains some sample text to demonstrate the two-column layout.", class: "text-gray-600"),
              content_tag(:button, "Action Button", class: "mt-4 bg-indigo-600 text-white px-4 py-2 rounded-md hover:bg-indigo-500")
            ])
          end,
          content_tag(:div, class: "bg-white p-6 rounded-lg shadow-sm") do
            safe_join([
              content_tag(:h3, "Right Column", class: "text-lg font-semibold text-gray-900 mb-4"),
              content_tag(:p, "This is the right column content. It shows how the layout component can contain complex nested structures.", class: "text-gray-600"),
              content_tag(:ul, class: "mt-4 space-y-2 text-sm text-gray-600") do
                safe_join([
                  content_tag(:li, "✓ Responsive design"),
                  content_tag(:li, "✓ Flexible containers"),
                  content_tag(:li, "✓ Customizable spacing")
                ])
              end
            ])
          end
        ])
      end
    end
  end

  # Three column layout example
  def three_column
    render Layout::BaseComponent.new(container: :wide, padding: :lg, background: :gray) do
      content_tag(:div, class: "grid grid-cols-1 md:grid-cols-3 gap-6") do
        safe_join([
          (1..3).map do |i|
            content_tag(:div, class: "bg-white p-6 rounded-lg shadow-sm text-center") do
              safe_join([
                content_tag(:div, class: "mx-auto h-12 w-12 bg-indigo-100 rounded-full flex items-center justify-center mb-4") do
                  content_tag(:span, i.to_s, class: "text-indigo-600 font-semibold")
                end,
                content_tag(:h3, "Feature #{i}", class: "text-lg font-semibold text-gray-900 mb-2"),
                content_tag(:p, "Description of feature #{i} goes here.", class: "text-gray-600 text-sm")
              ])
            end
          end
        ])
      end
    end
  end

  # Article layout example
  def article_layout
    render Layout::BaseComponent.new(container: :narrow, padding: :lg, background: :white) do
      content_tag(:article, class: "prose prose-gray max-w-none") do
        safe_join([
          content_tag(:header, class: "mb-8") do
            safe_join([
              content_tag(:h1, "Sample Article Title", class: "text-3xl font-bold text-gray-900 mb-2"),
              content_tag(:p, "Published on #{Date.current.strftime('%B %d, %Y')}", class: "text-gray-600 text-sm")
            ])
          end,
          content_tag(:div, class: "space-y-4 text-gray-700") do
            safe_join([
              content_tag(:p, "This is the first paragraph of the article. It demonstrates how the layout component can be used to create readable article layouts with proper typography and spacing."),
              content_tag(:p, "The narrow container ensures optimal reading width, while the padding provides comfortable margins around the content."),
              content_tag(:blockquote, class: "border-l-4 border-indigo-500 pl-4 italic text-gray-600") do
                "This is a sample blockquote to show how different content types look within the layout."
              end,
              content_tag(:p, "This is the final paragraph that wraps up the article content.")
            ])
          end
        ])
      end
    end
  end

  # Dashboard layout example
  def dashboard_layout
    render Layout::BaseComponent.new(container: :wide, padding: :lg, background: :gray) do
      content_tag(:div, class: "space-y-6") do
        safe_join([
          # Header
          content_tag(:div, class: "bg-white p-6 rounded-lg shadow-sm") do
            safe_join([
              content_tag(:h1, "Dashboard", class: "text-2xl font-bold text-gray-900"),
              content_tag(:p, "Welcome back! Here's an overview of your account.", class: "text-gray-600")
            ])
          end,
          # Stats grid
          content_tag(:div, class: "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6") do
            safe_join([
              [ "Users", "1,234", "↗ 12%", "text-green-600" ],
              [ "Revenue", "$45,678", "↗ 8%", "text-green-600" ],
              [ "Orders", "856", "↘ 3%", "text-red-600" ],
              [ "Conversion", "3.2%", "↗ 0.5%", "text-green-600" ]
            ].map do |title, value, change, color_class|
              content_tag(:div, class: "bg-white p-6 rounded-lg shadow-sm") do
                safe_join([
                  content_tag(:h3, title, class: "text-sm font-medium text-gray-500"),
                  content_tag(:p, value, class: "text-2xl font-bold text-gray-900 mt-2"),
                  content_tag(:p, change, class: "text-sm #{color_class} mt-1")
                ])
              end
            end)
          end,
          # Chart placeholder
          content_tag(:div, class: "bg-white p-6 rounded-lg shadow-sm") do
            safe_join([
              content_tag(:h3, "Analytics Chart", class: "text-lg font-semibold text-gray-900 mb-4"),
              content_tag(:div, "Chart would go here", class: "h-64 bg-gray-100 rounded flex items-center justify-center text-gray-500")
            ])
          end
        ])
      end
    end
  end
end
