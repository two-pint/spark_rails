# frozen_string_literal: true

class Tooltips::BaseComponentPreview < ViewComponent::Preview
  # Default tooltip with basic content
  # @param text text "Tooltip text"
  def default(text: "This is a helpful tooltip")
    content_tag(:div, class: "flex justify-center p-8") do
      render Tooltips::BaseComponent.new(text: text) do
        content_tag(:button, "Hover me", class: "bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700")
      end
    end
  end

  # All tooltip options
  # @param text text "Tooltip content"
  # @param position select { choices: [top, bottom, left, right, top_left, top_right, bottom_left, bottom_right] }
  # @param trigger select { choices: [hover, click, focus] }
  # @param variant select { choices: [dark, light, primary, success, warning, error, info] }
  # @param size select { choices: [sm, default, lg] }
  # @param arrow toggle
  def options(text: "Configurable tooltip", position: :top, trigger: :hover, variant: :dark, size: :default, arrow: true)
    content_tag(:div, class: "flex justify-center p-8") do
      render Tooltips::BaseComponent.new(text: text, position: position, trigger: trigger, variant: variant, size: size, arrow: arrow) do
        content_tag(:button, "Interact with me", class: "bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700")
      end
    end
  end

  # Position variants
  def positions
    content_tag(:div, class: "space-y-8 p-8") do
      safe_join([
        content_tag(:h3, "Tooltip Positions", class: "text-lg font-semibold text-gray-900 text-center"),
        content_tag(:div, class: "grid grid-cols-3 gap-8 max-w-md mx-auto") do
          safe_join([
            # Top row
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Top Left", position: :top_left) do
                content_tag(:button, "TL", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end,
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Top Center", position: :top) do
                content_tag(:button, "TC", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end,
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Top Right", position: :top_right) do
                content_tag(:button, "TR", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end,
            # Middle row
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Left Side", position: :left) do
                content_tag(:button, "L", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end,
            content_tag(:div, class: "flex justify-center") do
              content_tag(:div, "Center", class: "bg-gray-200 px-3 py-2 rounded text-sm text-gray-600")
            end,
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Right Side", position: :right) do
                content_tag(:button, "R", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end,
            # Bottom row
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Bottom Left", position: :bottom_left) do
                content_tag(:button, "BL", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end,
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Bottom Center", position: :bottom) do
                content_tag(:button, "BC", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end,
            content_tag(:div, class: "flex justify-center") do
              render Tooltips::BaseComponent.new(text: "Bottom Right", position: :bottom_right) do
                content_tag(:button, "BR", class: "bg-gray-600 text-white px-3 py-2 rounded text-sm")
              end
            end
          ])
        end
      ])
    end
  end

  # Variant showcase
  def variants
    content_tag(:div, class: "space-y-6 p-8") do
      safe_join([
        content_tag(:h3, "Tooltip Variants", class: "text-lg font-semibold text-gray-900 text-center"),
        content_tag(:div, class: "flex flex-wrap justify-center gap-4") do
          safe_join([
            render(Tooltips::BaseComponent.new(text: "Dark tooltip (default)", variant: :dark)) do
              content_tag(:button, "Dark", class: "bg-gray-900 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "Light tooltip with border", variant: :light)) do
              content_tag(:button, "Light", class: "bg-white border border-gray-300 text-gray-700 px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "Primary tooltip", variant: :primary)) do
              content_tag(:button, "Primary", class: "bg-indigo-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "Success tooltip", variant: :success)) do
              content_tag(:button, "Success", class: "bg-green-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "Warning tooltip", variant: :warning)) do
              content_tag(:button, "Warning", class: "bg-yellow-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "Error tooltip", variant: :error)) do
              content_tag(:button, "Error", class: "bg-red-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "Info tooltip", variant: :info)) do
              content_tag(:button, "Info", class: "bg-blue-600 text-white px-4 py-2 rounded")
            end
          ])
        end
      ])
    end
  end

  # Size variants
  def sizes
    content_tag(:div, class: "space-y-6 p-8") do
      safe_join([
        content_tag(:h3, "Tooltip Sizes", class: "text-lg font-semibold text-gray-900 text-center"),
        content_tag(:div, class: "flex justify-center gap-4") do
          safe_join([
            render(Tooltips::BaseComponent.new(text: "Small tooltip", size: :sm)) do
              content_tag(:button, "Small", class: "bg-indigo-600 text-white px-3 py-1.5 rounded text-sm")
            end,
            render(Tooltips::BaseComponent.new(text: "Default tooltip", size: :default)) do
              content_tag(:button, "Default", class: "bg-indigo-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "Large tooltip", size: :lg)) do
              content_tag(:button, "Large", class: "bg-indigo-600 text-white px-5 py-2.5 rounded text-lg")
            end
          ])
        end
      ])
    end
  end

  # Trigger types
  def triggers
    content_tag(:div, class: "space-y-6 p-8") do
      safe_join([
        content_tag(:h3, "Trigger Types", class: "text-lg font-semibold text-gray-900 text-center"),
        content_tag(:div, class: "space-y-4") do
          safe_join([
            content_tag(:div, class: "flex items-center justify-center gap-4") do
              safe_join([
                content_tag(:span, "Hover:", class: "text-sm text-gray-600"),
                render(Tooltips::BaseComponent.new(text: "Appears on hover", trigger: :hover)) do
                  content_tag(:button, "Hover me", class: "bg-indigo-600 text-white px-4 py-2 rounded")
                end
              ])
            end,
            content_tag(:div, class: "flex items-center justify-center gap-4") do
              safe_join([
                content_tag(:span, "Click:", class: "text-sm text-gray-600"),
                render(Tooltips::BaseComponent.new(text: "Click to toggle", trigger: :click)) do
                  content_tag(:button, "Click me", class: "bg-green-600 text-white px-4 py-2 rounded")
                end
              ])
            end,
            content_tag(:div, class: "flex items-center justify-center gap-4") do
              safe_join([
                content_tag(:span, "Focus:", class: "text-sm text-gray-600"),
                render(Tooltips::BaseComponent.new(text: "Shows on focus", trigger: :focus)) do
                  content_tag(:input, "", type: "text", placeholder: "Focus me", class: "border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-blue-500")
                end
              ])
            end
          ])
        end
      ])
    end
  end

  # Without arrows
  def without_arrows
    content_tag(:div, class: "space-y-6 p-8") do
      safe_join([
        content_tag(:h3, "Tooltips Without Arrows", class: "text-lg font-semibold text-gray-900 text-center"),
        content_tag(:div, class: "flex justify-center gap-4") do
          safe_join([
            render(Tooltips::BaseComponent.new(text: "No arrow on top", position: :top, arrow: false)) do
              content_tag(:button, "Top", class: "bg-gray-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "No arrow on bottom", position: :bottom, arrow: false)) do
              content_tag(:button, "Bottom", class: "bg-gray-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "No arrow on left", position: :left, arrow: false)) do
              content_tag(:button, "Left", class: "bg-gray-600 text-white px-4 py-2 rounded")
            end,
            render(Tooltips::BaseComponent.new(text: "No arrow on right", position: :right, arrow: false)) do
              content_tag(:button, "Right", class: "bg-gray-600 text-white px-4 py-2 rounded")
            end
          ])
        end
      ])
    end
  end

  # Icon tooltips
  def icon_tooltips
    content_tag(:div, class: "space-y-6 p-8") do
      safe_join([
        content_tag(:h3, "Icon Tooltips", class: "text-lg font-semibold text-gray-900 text-center"),
        content_tag(:div, class: "flex justify-center gap-6") do
          safe_join([
            render(Tooltips::BaseComponent.new(text: "Settings")) do
              content_tag(:button, class: "p-2 text-gray-600 hover:text-gray-900 rounded") do
                content_tag(:svg, class: "h-5 w-5", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M9.594 3.94c.09-.542.56-.94 1.11-.94h2.593c.55 0 1.02.398 1.11.94l.213 1.281c.063.374.313.686.645.87.074.04.147.083.22.127.324.196.72.257 1.075.124l1.217-.456a1.125 1.125 0 011.37.49l1.296 2.247a1.125 1.125 0 01-.26 1.431l-1.003.827c-.293.24-.438.613-.431.992a6.759 6.759 0 010 .255c-.007.378.138.75.43.99l1.005.828c.424.35.534.954.26 1.43l-1.298 2.247a1.125 1.125 0 01-1.369.491l-1.217-.456c-.355-.133-.75-.072-1.076.124a6.57 6.57 0 01-.22.128c-.331.183-.581.495-.644.869l-.213 1.28c-.09.543-.56.941-1.11.941h-2.594c-.55 0-1.02-.398-1.11-.94l-.213-1.281c-.062-.374-.312-.686-.644-.87a6.52 6.52 0 01-.22-.127c-.325-.196-.72-.257-1.076-.124l-1.217.456a1.125 1.125 0 01-1.369-.49l-1.297-2.247a1.125 1.125 0 01.26-1.431l1.004-.827c.292-.24.437-.613.43-.992a6.932 6.932 0 010-.255c.007-.378-.138-.75-.43-.99l-1.004-.828a1.125 1.125 0 01-.26-1.43l1.297-2.247a1.125 1.125 0 011.37-.491l1.216.456c.356.133.751.072 1.076-.124.072-.044.146-.087.22-.128.332-.183.582-.495.644-.869l.214-1.281z")
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M15 12a3 3 0 11-6 0 3 3 0 016 0z")
                end
              end
            end,
            render(Tooltips::BaseComponent.new(text: "Help & Support")) do
              content_tag(:button, class: "p-2 text-gray-600 hover:text-gray-900 rounded") do
                content_tag(:svg, class: "h-5 w-5", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M9.879 7.519c1.171-1.025 3.071-1.025 4.242 0 1.172 1.025 1.172 2.687 0 3.712-.203.179-.43.326-.67.442-.745.361-1.45.999-1.45 1.827v.75M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9 5.25h.008v.008H12v-.008z")
                end
              end
            end,
            render(Tooltips::BaseComponent.new(text: "Notifications")) do
              content_tag(:button, class: "p-2 text-gray-600 hover:text-gray-900 rounded relative") do
                safe_join([
                  content_tag(:svg, class: "h-5 w-5", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                    content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M14.857 17.082a23.848 23.848 0 005.454-1.31A8.967 8.967 0 0118 9.75v-.7a6 6 0 00-12 0v.7c0 2.123.8 4.233 2.31 5.832a23.847 23.847 0 005.454 1.31m5.714 0a24.255 24.255 0 01-5.714 0m5.714 0a3 3 0 11-5.714 0")
                  end,
                  content_tag(:span, "", class: "absolute top-0 right-0 h-2 w-2 bg-red-500 rounded-full")
                ])
              end
            end,
            render(Tooltips::BaseComponent.new(text: "Download")) do
              content_tag(:button, class: "p-2 text-gray-600 hover:text-gray-900 rounded") do
                content_tag(:svg, class: "h-5 w-5", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5M16.5 12L12 16.5m0 0L7.5 12m4.5 4.5V3")
                end
              end
            end
          ])
        end
      ])
    end
  end

  # Form field tooltips
  def form_tooltips
    content_tag(:div, class: "max-w-md mx-auto p-8") do
      safe_join([
        content_tag(:h3, "Form Field Tooltips", class: "text-lg font-semibold text-gray-900 mb-6"),
        content_tag(:form, class: "space-y-4") do
          safe_join([
            content_tag(:div) do
              safe_join([
                content_tag(:div, class: "flex items-center gap-2 mb-2") do
                  safe_join([
                    content_tag(:label, "Username", for: "username", class: "block text-sm font-medium text-gray-700"),
                    render(Tooltips::BaseComponent.new(text: "Username must be 3-20 characters long", variant: :info, position: :right)) do
                      content_tag(:button, type: "button", class: "text-gray-400 hover:text-gray-600") do
                        content_tag(:svg, class: "h-4 w-4", fill: "currentColor", viewBox: "0 0 20 20") do
                          content_tag(:path, "", fill_rule: "evenodd", d: "M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z", clip_rule: "evenodd")
                        end
                      end
                    end
                  ])
                end,
                content_tag(:input, "", type: "text", id: "username", class: "block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500")
              ])
            end,
            content_tag(:div) do
              safe_join([
                content_tag(:div, class: "flex items-center gap-2 mb-2") do
                  safe_join([
                    content_tag(:label, "Password", for: "password", class: "block text-sm font-medium text-gray-700"),
                    render(Tooltips::BaseComponent.new(text: "Password must contain at least 8 characters, including uppercase, lowercase, and numbers", variant: :warning, position: :right)) do
                      content_tag(:button, type: "button", class: "text-gray-400 hover:text-gray-600") do
                        content_tag(:svg, class: "h-4 w-4", fill: "currentColor", viewBox: "0 0 20 20") do
                          content_tag(:path, "", fill_rule: "evenodd", d: "M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z", clip_rule: "evenodd")
                        end
                      end
                    end
                  ])
                end,
                content_tag(:input, "", type: "password", id: "password", class: "block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500")
              ])
            end,
            content_tag(:div) do
              safe_join([
                content_tag(:div, class: "flex items-center gap-2 mb-2") do
                  safe_join([
                    content_tag(:label, "Email", for: "email", class: "block text-sm font-medium text-gray-700"),
                    render(Tooltips::BaseComponent.new(text: "We'll never share your email with anyone", variant: :success, position: :right)) do
                      content_tag(:button, type: "button", class: "text-gray-400 hover:text-gray-600") do
                        content_tag(:svg, class: "h-4 w-4", fill: "currentColor", viewBox: "0 0 20 20") do
                          content_tag(:path, "", fill_rule: "evenodd", d: "M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z", clip_rule: "evenodd")
                        end
                      end
                    end
                  ])
                end,
                content_tag(:input, "", type: "email", id: "email", class: "block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500")
              ])
            end
          ])
        end
      ])
    end
  end

  # Complex tooltip content
  def complex_content
    content_tag(:div, class: "flex justify-center p-8") do
      render Tooltips::BaseComponent.new(text: "This tooltip has more detailed information that spans multiple lines and provides comprehensive help text for the user.", variant: :light, size: :lg, position: :bottom) do
        content_tag(:button, "Complex Tooltip", class: "bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700")
      end
    end
  end
end
