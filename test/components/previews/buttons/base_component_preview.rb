# frozen_string_literal: true

class Buttons::BaseComponentPreview < ViewComponent::Preview
  # Default button with basic content
  # @param content text "Button text"
  def default(content: "Click me")
    render Buttons::BaseComponent.new do
      content
    end
  end

  # All button variants
  # @param variant select { choices: [primary, secondary, destructive, outline, ghost, link] }
  # @param size select { choices: [sm, default, lg, icon] }
  # @param disabled toggle
  def variants(variant: :primary, size: :default, disabled: false)
    render Buttons::BaseComponent.new(variant: variant, size: size, disabled: disabled) do
      case size
      when :icon
        content_tag(:svg, class: "h-4 w-4", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
          content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M12 4.5v15m7.5-7.5h-15")
        end
      else
        "#{variant.to_s.capitalize} Button"
      end
    end
  end

  # Button showcase with all variants
  def showcase
    content_tag(:div, class: "space-y-6") do
      safe_join([
        # Primary buttons
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Primary Buttons", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-3") do
              safe_join([
                render(Buttons::BaseComponent.new(variant: :primary, size: :sm)) { "Small" },
                render(Buttons::BaseComponent.new(variant: :primary, size: :default)) { "Default" },
                render(Buttons::BaseComponent.new(variant: :primary, size: :lg)) { "Large" },
                render(Buttons::BaseComponent.new(variant: :primary, disabled: true)) { "Disabled" }
              ])
            end
          ])
        end,
        # Secondary buttons
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Secondary Buttons", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-3") do
              safe_join([
                render(Buttons::BaseComponent.new(variant: :secondary, size: :sm)) { "Small" },
                render(Buttons::BaseComponent.new(variant: :secondary, size: :default)) { "Default" },
                render(Buttons::BaseComponent.new(variant: :secondary, size: :lg)) { "Large" },
                render(Buttons::BaseComponent.new(variant: :secondary, disabled: true)) { "Disabled" }
              ])
            end
          ])
        end,
        # Destructive buttons
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Destructive Buttons", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-3") do
              safe_join([
                render(Buttons::BaseComponent.new(variant: :destructive, size: :sm)) { "Delete" },
                render(Buttons::BaseComponent.new(variant: :destructive, size: :default)) { "Remove" },
                render(Buttons::BaseComponent.new(variant: :destructive, size: :lg)) { "Destroy" }
              ])
            end
          ])
        end,
        # Outline buttons
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Outline Buttons", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-3") do
              safe_join([
                render(Buttons::BaseComponent.new(variant: :outline, size: :sm)) { "Small" },
                render(Buttons::BaseComponent.new(variant: :outline, size: :default)) { "Default" },
                render(Buttons::BaseComponent.new(variant: :outline, size: :lg)) { "Large" }
              ])
            end
          ])
        end,
        # Ghost buttons
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Ghost Buttons", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-3") do
              safe_join([
                render(Buttons::BaseComponent.new(variant: :ghost, size: :sm)) { "Small" },
                render(Buttons::BaseComponent.new(variant: :ghost, size: :default)) { "Default" },
                render(Buttons::BaseComponent.new(variant: :ghost, size: :lg)) { "Large" }
              ])
            end
          ])
        end,
        # Link buttons
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Link Buttons", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-3") do
              safe_join([
                render(Buttons::BaseComponent.new(variant: :link, size: :sm)) { "Small Link" },
                render(Buttons::BaseComponent.new(variant: :link, size: :default)) { "Default Link" },
                render(Buttons::BaseComponent.new(variant: :link, size: :lg)) { "Large Link" }
              ])
            end
          ])
        end
      ])
    end
  end

  # Icon buttons
  def icon_buttons
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Icon Buttons", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "flex flex-wrap gap-3") do
          safe_join([
            render(Buttons::BaseComponent.new(variant: :primary, size: :icon)) do
              content_tag(:svg, class: "h-4 w-4", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M12 4.5v15m7.5-7.5h-15")
              end
            end,
            render(Buttons::BaseComponent.new(variant: :secondary, size: :icon)) do
              content_tag(:svg, class: "h-4 w-4", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L6.832 19.82a4.5 4.5 0 0 1-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 0 1 1.13-1.897L16.863 4.487Zm0 0L19.5 7.125")
              end
            end,
            render(Buttons::BaseComponent.new(variant: :destructive, size: :icon)) do
              content_tag(:svg, class: "h-4 w-4", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0")
              end
            end,
            render(Buttons::BaseComponent.new(variant: :outline, size: :icon)) do
              content_tag(:svg, class: "h-4 w-4", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z")
              end
            end
          ])
        end
      ])
    end
  end

  # Buttons with icons and text
  def with_icons
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Buttons with Icons", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "flex flex-wrap gap-3") do
          safe_join([
            render(Buttons::BaseComponent.new(variant: :primary)) do
              safe_join([
                content_tag(:svg, class: "h-4 w-4 mr-2", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M12 4.5v15m7.5-7.5h-15")
                end,
                "Add Item"
              ])
            end,
            render(Buttons::BaseComponent.new(variant: :secondary)) do
              safe_join([
                content_tag(:svg, class: "h-4 w-4 mr-2", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M3 16.5v2.25A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75V16.5M16.5 12L12 16.5m0 0L7.5 12m4.5 4.5V3")
                end,
                "Download"
              ])
            end,
            render(Buttons::BaseComponent.new(variant: :outline)) do
              safe_join([
                "Share",
                content_tag(:svg, class: "h-4 w-4 ml-2", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M7.217 10.907a2.25 2.25 0 100 2.186m0-2.186c.18.324.283.696.283 1.093s-.103.77-.283 1.093m0-2.186l9.566-5.314m-9.566 7.5l9.566 5.314m0 0a2.25 2.25 0 103.935 2.186 2.25 2.25 0 00-3.935-2.186zm0-12.814a2.25 2.25 0 103.933-2.185 2.25 2.25 0 00-3.933 2.185z")
                end
              ])
            end
          ])
        end
      ])
    end
  end

  # Link buttons (href attribute)
  def link_buttons
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Link Buttons", class: "text-lg font-semibold text-gray-900"),
        content_tag(:p, "These buttons render as <a> tags with href attributes", class: "text-sm text-gray-600"),
        content_tag(:div, class: "flex flex-wrap gap-3") do
          safe_join([
            render(Buttons::BaseComponent.new(variant: :primary, href: "#")) { "Primary Link" },
            render(Buttons::BaseComponent.new(variant: :secondary, href: "#")) { "Secondary Link" },
            render(Buttons::BaseComponent.new(variant: :outline, href: "#")) { "Outline Link" },
            render(Buttons::BaseComponent.new(variant: :link, href: "#")) { "Text Link" }
          ])
        end
      ])
    end
  end

  # Form buttons
  def form_buttons
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Form Buttons", class: "text-lg font-semibold text-gray-900"),
        content_tag(:form, class: "space-y-4") do
          safe_join([
            content_tag(:div, class: "flex space-x-3") do
              safe_join([
                render(Buttons::BaseComponent.new(type: :submit, variant: :primary)) { "Submit" },
                render(Buttons::BaseComponent.new(type: :reset, variant: :secondary)) { "Reset" },
                render(Buttons::BaseComponent.new(type: :button, variant: :outline)) { "Cancel" }
              ])
            end
          ])
        end
      ])
    end
  end
end
