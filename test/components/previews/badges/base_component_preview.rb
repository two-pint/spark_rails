# frozen_string_literal: true

class Badges::BaseComponentPreview < ViewComponent::Preview
  # Default badge with basic content
  # @param content text "Badge text"
  def default(content: "Badge")
    render Badges::BaseComponent.new do
      content
    end
  end

  # All badge variants and sizes
  # @param variant select { choices: [default, primary, secondary, success, warning, error, info, outline, solid_primary, solid_secondary, solid_success, solid_warning, solid_error, solid_info] }
  # @param size select { choices: [sm, default, lg, xl] }
  # @param rounded select { choices: [none, sm, default, lg, full] }
  # @param removable toggle
  def variants(variant: :default, size: :default, rounded: :default, removable: false)
    render Badges::BaseComponent.new(variant: variant, size: size, rounded: rounded, removable: removable) do
      "#{variant.to_s.humanize} Badge"
    end
  end

  # Color variants showcase
  def color_variants
    content_tag(:div, class: "space-y-6") do
      safe_join([
        # Light variants
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Light Variants", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-2") do
              safe_join([
                render(Badges::BaseComponent.new(variant: :default)) { "Default" },
                render(Badges::BaseComponent.new(variant: :primary)) { "Primary" },
                render(Badges::BaseComponent.new(variant: :secondary)) { "Secondary" },
                render(Badges::BaseComponent.new(variant: :success)) { "Success" },
                render(Badges::BaseComponent.new(variant: :warning)) { "Warning" },
                render(Badges::BaseComponent.new(variant: :error)) { "Error" },
                render(Badges::BaseComponent.new(variant: :info)) { "Info" },
                render(Badges::BaseComponent.new(variant: :outline)) { "Outline" }
              ])
            end
          ])
        end,
        # Solid variants
        content_tag(:div) do
          safe_join([
            content_tag(:h3, "Solid Variants", class: "text-lg font-semibold text-gray-900 mb-3"),
            content_tag(:div, class: "flex flex-wrap gap-2") do
              safe_join([
                render(Badges::BaseComponent.new(variant: :solid_primary)) { "Primary" },
                render(Badges::BaseComponent.new(variant: :solid_secondary)) { "Secondary" },
                render(Badges::BaseComponent.new(variant: :solid_success)) { "Success" },
                render(Badges::BaseComponent.new(variant: :solid_warning)) { "Warning" },
                render(Badges::BaseComponent.new(variant: :solid_error)) { "Error" },
                render(Badges::BaseComponent.new(variant: :solid_info)) { "Info" }
              ])
            end
          ])
        end
      ])
    end
  end

  # Size variants
  def sizes
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Size Variants", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "flex flex-wrap items-center gap-3") do
          safe_join([
            render(Badges::BaseComponent.new(size: :sm, variant: :primary)) { "Small" },
            render(Badges::BaseComponent.new(size: :default, variant: :primary)) { "Default" },
            render(Badges::BaseComponent.new(size: :lg, variant: :primary)) { "Large" },
            render(Badges::BaseComponent.new(size: :xl, variant: :primary)) { "Extra Large" }
          ])
        end
      ])
    end
  end

  # Rounded variants
  def rounded_variants
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Rounded Variants", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "flex flex-wrap items-center gap-3") do
          safe_join([
            render(Badges::BaseComponent.new(rounded: :none, variant: :primary)) { "None" },
            render(Badges::BaseComponent.new(rounded: :sm, variant: :primary)) { "Small" },
            render(Badges::BaseComponent.new(rounded: :default, variant: :primary)) { "Default" },
            render(Badges::BaseComponent.new(rounded: :lg, variant: :primary)) { "Large" },
            render(Badges::BaseComponent.new(rounded: :full, variant: :primary)) { "Full" }
          ])
        end
      ])
    end
  end

  # Removable badges
  def removable_badges
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Removable Badges", class: "text-lg font-semibold text-gray-900"),
        content_tag(:p, "Click the × button to remove badges", class: "text-sm text-gray-600"),
        content_tag(:div, class: "flex flex-wrap gap-2") do
          safe_join([
            render(Badges::BaseComponent.new(variant: :primary, removable: true)) { "JavaScript" },
            render(Badges::BaseComponent.new(variant: :success, removable: true)) { "Ruby" },
            render(Badges::BaseComponent.new(variant: :info, removable: true)) { "Python" },
            render(Badges::BaseComponent.new(variant: :warning, removable: true)) { "CSS" },
            render(Badges::BaseComponent.new(variant: :error, removable: true)) { "HTML" }
          ])
        end
      ])
    end
  end

  # Badge with icons
  def with_icons
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Badges with Icons", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "flex flex-wrap gap-2") do
          safe_join([
            render(Badges::BaseComponent.new(variant: :success)) do
              safe_join([
                content_tag(:svg, class: "h-3 w-3 mr-1", fill: "currentColor", viewBox: "0 0 20 20") do
                  content_tag(:path, "", fill_rule: "evenodd", d: "M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z", clip_rule: "evenodd")
                end,
                "Approved"
              ])
            end,
            render(Badges::BaseComponent.new(variant: :warning)) do
              safe_join([
                content_tag(:svg, class: "h-3 w-3 mr-1", fill: "currentColor", viewBox: "0 0 20 20") do
                  content_tag(:path, "", fill_rule: "evenodd", d: "M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z", clip_rule: "evenodd")
                end,
                "Pending"
              ])
            end,
            render(Badges::BaseComponent.new(variant: :error)) do
              safe_join([
                content_tag(:svg, class: "h-3 w-3 mr-1", fill: "currentColor", viewBox: "0 0 20 20") do
                  content_tag(:path, "", fill_rule: "evenodd", d: "M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z", clip_rule: "evenodd")
                end,
                "Rejected"
              ])
            end,
            render(Badges::BaseComponent.new(variant: :info)) do
              safe_join([
                content_tag(:svg, class: "h-3 w-3 mr-1", fill: "currentColor", viewBox: "0 0 20 20") do
                  content_tag(:path, "", fill_rule: "evenodd", d: "M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z", clip_rule: "evenodd")
                end,
                "Info"
              ])
            end
          ])
        end
      ])
    end
  end

  # Badge with dots
  def with_dots
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Badges with Dots", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "flex flex-wrap gap-2") do
          safe_join([
            render(Badges::BaseComponent.new(variant: :success)) do
              safe_join([
                content_tag(:div, "", class: "h-2 w-2 rounded-full bg-green-500 mr-1.5"),
                "Online"
              ])
            end,
            render(Badges::BaseComponent.new(variant: :warning)) do
              safe_join([
                content_tag(:div, "", class: "h-2 w-2 rounded-full bg-yellow-500 mr-1.5"),
                "Away"
              ])
            end,
            render(Badges::BaseComponent.new(variant: :error)) do
              safe_join([
                content_tag(:div, "", class: "h-2 w-2 rounded-full bg-red-500 mr-1.5"),
                "Offline"
              ])
            end,
            render(Badges::BaseComponent.new(variant: :secondary)) do
              safe_join([
                content_tag(:div, "", class: "h-2 w-2 rounded-full bg-gray-500 mr-1.5"),
                "Unknown"
              ])
            end
          ])
        end
      ])
    end
  end

  # Link badges
  def link_badges
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Link Badges", class: "text-lg font-semibold text-gray-900"),
        content_tag(:p, "These badges are clickable links", class: "text-sm text-gray-600"),
        content_tag(:div, class: "flex flex-wrap gap-2") do
          safe_join([
            render(Badges::BaseComponent.new(variant: :primary, href: "#")) { "GitHub" },
            render(Badges::BaseComponent.new(variant: :info, href: "#")) { "Documentation" },
            render(Badges::BaseComponent.new(variant: :success, href: "#")) { "Live Demo" },
            render(Badges::BaseComponent.new(variant: :outline, href: "#")) { "Download" }
          ])
        end
      ])
    end
  end

  # Number badges
  def number_badges
    content_tag(:div, class: "space-y-4") do
      safe_join([
        content_tag(:h3, "Number Badges", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "flex flex-wrap items-center gap-3") do
          safe_join([
            content_tag(:div, class: "flex items-center") do
              safe_join([
                content_tag(:span, "Notifications", class: "text-gray-700 mr-2"),
                render(Badges::BaseComponent.new(variant: :solid_error, rounded: :full, size: :sm)) { "3" }
              ])
            end,
            content_tag(:div, class: "flex items-center") do
              safe_join([
                content_tag(:span, "Messages", class: "text-gray-700 mr-2"),
                render(Badges::BaseComponent.new(variant: :solid_primary, rounded: :full, size: :sm)) { "12" }
              ])
            end,
            content_tag(:div, class: "flex items-center") do
              safe_join([
                content_tag(:span, "Cart", class: "text-gray-700 mr-2"),
                render(Badges::BaseComponent.new(variant: :solid_success, rounded: :full, size: :sm)) { "5" }
              ])
            end,
            content_tag(:div, class: "flex items-center") do
              safe_join([
                content_tag(:span, "Inbox", class: "text-gray-700 mr-2"),
                render(Badges::BaseComponent.new(variant: :solid_info, rounded: :full, size: :sm)) { "99+" }
              ])
            end
          ])
        end
      ])
    end
  end

  # Tag system example
  def tag_system
    content_tag(:div, class: "space-y-6") do
      safe_join([
        content_tag(:h3, "Tag System Example", class: "text-lg font-semibold text-gray-900"),
        content_tag(:div, class: "space-y-4") do
          safe_join([
            content_tag(:div) do
              safe_join([
                content_tag(:h4, "Skills", class: "text-sm font-medium text-gray-700 mb-2"),
                content_tag(:div, class: "flex flex-wrap gap-1") do
                  safe_join([
                    render(Badges::BaseComponent.new(variant: :primary, size: :sm, removable: true)) { "React" },
                    render(Badges::BaseComponent.new(variant: :primary, size: :sm, removable: true)) { "Vue.js" },
                    render(Badges::BaseComponent.new(variant: :primary, size: :sm, removable: true)) { "TypeScript" },
                    render(Badges::BaseComponent.new(variant: :primary, size: :sm, removable: true)) { "Node.js" },
                    render(Badges::BaseComponent.new(variant: :primary, size: :sm, removable: true)) { "GraphQL" }
                  ])
                end
              ])
            end,
            content_tag(:div) do
              safe_join([
                content_tag(:h4, "Categories", class: "text-sm font-medium text-gray-700 mb-2"),
                content_tag(:div, class: "flex flex-wrap gap-1") do
                  safe_join([
                    render(Badges::BaseComponent.new(variant: :success, size: :sm)) { "Frontend" },
                    render(Badges::BaseComponent.new(variant: :info, size: :sm)) { "Backend" },
                    render(Badges::BaseComponent.new(variant: :warning, size: :sm)) { "DevOps" },
                    render(Badges::BaseComponent.new(variant: :secondary, size: :sm)) { "Design" }
                  ])
                end
              ])
            end,
            content_tag(:div) do
              safe_join([
                content_tag(:h4, "Status", class: "text-sm font-medium text-gray-700 mb-2"),
                content_tag(:div, class: "flex flex-wrap gap-1") do
                  safe_join([
                    render(Badges::BaseComponent.new(variant: :solid_success, size: :sm, rounded: :full)) { "Active" },
                    render(Badges::BaseComponent.new(variant: :solid_warning, size: :sm, rounded: :full)) { "Pending" },
                    render(Badges::BaseComponent.new(variant: :solid_error, size: :sm, rounded: :full)) { "Inactive" }
                  ])
                end
              ])
            end
          ])
        end
      ])
    end
  end
end
