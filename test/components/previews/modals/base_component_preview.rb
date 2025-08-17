# frozen_string_literal: true

class Modals::BaseComponentPreview < ViewComponent::Preview
  layout "lookbook_modal"

  # Default modal with basic content
  # @param content text "Modal content"
  def default(content: "This is a basic modal with default styling")
    render Modals::BaseComponent.new do
      content_tag(:div, class: "p-6") do
        safe_join([
          content_tag(:h3, "Modal Title", class: "text-lg font-semibold text-gray-900 mb-4"),
          content_tag(:div, content, class: "text-gray-600")
        ])
      end
    end
  end

  # All modal sizes
  # @param size select { choices: [sm, default, lg, xl, full] }
  # @param closable toggle
  # @param backdrop_closable toggle
  def sizes(size: :default, closable: true, backdrop_closable: true)
    render Modals::BaseComponent.new(size: size, closable: closable, backdrop_closable: backdrop_closable) do
      content_tag(:div, class: "p-6") do
        safe_join([
          content_tag(:h3, "Modal Size: #{size.to_s.capitalize}", class: "text-lg font-semibold text-gray-900 mb-4"),
          content_tag(:p, "This modal demonstrates the #{size} size variant.", class: "text-gray-600 mb-4"),
          content_tag(:p, "Closable: #{closable ? 'Yes' : 'No'}", class: "text-sm text-gray-500"),
          content_tag(:p, "Backdrop closable: #{backdrop_closable ? 'Yes' : 'No'}", class: "text-sm text-gray-500")
        ])
      end
    end
  end

  # Confirmation dialog
  def confirmation_dialog
    render Modals::BaseComponent.new(size: :sm, closable: false) do
      content_tag(:div, class: "p-6") do
        safe_join([
          content_tag(:div, class: "flex items-center") do
            safe_join([
              content_tag(:div, class: "mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100") do
                content_tag(:svg, class: "h-6 w-6 text-red-600", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z")
                end
              end,
              content_tag(:div, class: "mt-3 text-center sm:ml-4 sm:mt-0 sm:text-left") do
                safe_join([
                  content_tag(:h3, "Delete Account", class: "text-base font-semibold leading-6 text-gray-900"),
                  content_tag(:div, class: "mt-2") do
                    content_tag(:p, "Are you sure you want to delete your account? This action cannot be undone.", class: "text-sm text-gray-500")
                  end
                ])
              end
            ])
          end,
          content_tag(:div, class: "mt-5 sm:mt-4 sm:flex sm:flex-row-reverse") do
            safe_join([
              content_tag(:button, "Delete",
                type: "button",
                class: "inline-flex w-full justify-center rounded-md bg-red-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-red-500 sm:ml-3 sm:w-auto"
              ),
              content_tag(:button, "Cancel",
                type: "button",
                class: "mt-3 inline-flex w-full justify-center rounded-md bg-white px-3 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50 sm:mt-0 sm:w-auto"
              )
            ])
          end
        ])
      end
    end
  end

  # Form modal
  def form_modal
    render Modals::BaseComponent.new(size: :lg) do
      content_tag(:div, class: "p-6") do
        safe_join([
          content_tag(:div, class: "mb-6") do
            safe_join([
              content_tag(:h3, "Create New Project", class: "text-lg font-semibold text-gray-900"),
              content_tag(:p, "Fill out the form below to create a new project.", class: "mt-1 text-sm text-gray-600")
            ])
          end,
          content_tag(:form, class: "space-y-4") do
            safe_join([
              content_tag(:div) do
                safe_join([
                  content_tag(:label, "Project Name", for: "project-name", class: "block text-sm font-medium text-gray-700"),
                  content_tag(:input, "",
                    type: "text",
                    id: "project-name",
                    name: "project-name",
                    class: "mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                  )
                ])
              end,
              content_tag(:div) do
                safe_join([
                  content_tag(:label, "Description", for: "description", class: "block text-sm font-medium text-gray-700"),
                  content_tag(:textarea, "",
                    id: "description",
                    name: "description",
                    rows: 3,
                    class: "mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm"
                  )
                ])
              end,
              content_tag(:div, class: "flex justify-end space-x-3 pt-4") do
                safe_join([
                  content_tag(:button, "Cancel",
                    type: "button",
                    class: "rounded-md border border-gray-300 bg-white px-4 py-2 text-sm font-medium text-gray-700 shadow-sm hover:bg-gray-50"
                  ),
                  content_tag(:button, "Create Project",
                    type: "submit",
                    class: "rounded-md bg-indigo-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-indigo-500"
                  )
                ])
              end
            ])
          end
        ])
      end
    end
  end

  # Notification modal
  def notification_modal
    render Modals::BaseComponent.new(size: :sm) do
      content_tag(:div, class: "p-6") do
        safe_join([
          content_tag(:div, class: "flex items-center") do
            safe_join([
              content_tag(:div, class: "mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-green-100") do
                content_tag(:svg, class: "h-6 w-6 text-green-600", fill: "none", viewBox: "0 0 24 24", stroke_width: "1.5", stroke: "currentColor") do
                  content_tag(:path, "", stroke_linecap: "round", stroke_linejoin: "round", d: "M4.5 12.75l6 6 9-13.5")
                end
              end,
              content_tag(:div, class: "mt-3 text-center sm:ml-4 sm:mt-0 sm:text-left") do
                safe_join([
                  content_tag(:h3, "Success!", class: "text-base font-semibold leading-6 text-gray-900"),
                  content_tag(:div, class: "mt-2") do
                    content_tag(:p, "Your changes have been saved successfully.", class: "text-sm text-gray-500")
                  end
                ])
              end
            ])
          end,
          content_tag(:div, class: "mt-5 sm:mt-4 sm:flex sm:flex-row-reverse") do
            content_tag(:button, "Continue",
              type: "button",
              class: "inline-flex w-full justify-center rounded-md bg-green-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-green-500 sm:w-auto"
            )
          end
        ])
      end
    end
  end
end
