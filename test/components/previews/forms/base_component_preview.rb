# frozen_string_literal: true

class Forms::BaseComponentPreview < ViewComponent::Preview
  # Default form with basic content
  # @param content text "Form content"
  def default(content: "This is a basic form container")
    render Forms::BaseComponent.new do
      content_tag(:div, content, class: "text-gray-900")
    end
  end

  # Sample contact form
  def contact_form
    render Forms::BaseComponent.new do
      content_tag(:form, class: "space-y-6") do
        safe_join([
          content_tag(:div) do
            safe_join([
              content_tag(:label, "Name", for: "name", class: "block text-sm font-medium leading-6 text-gray-900"),
              content_tag(:input, "",
                type: "text",
                id: "name",
                name: "name",
                class: "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
              )
            ])
          end,
          content_tag(:div) do
            safe_join([
              content_tag(:label, "Email", for: "email", class: "block text-sm font-medium leading-6 text-gray-900"),
              content_tag(:input, "",
                type: "email",
                id: "email",
                name: "email",
                class: "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
              )
            ])
          end,
          content_tag(:div) do
            safe_join([
              content_tag(:label, "Message", for: "message", class: "block text-sm font-medium leading-6 text-gray-900"),
              content_tag(:textarea, "",
                id: "message",
                name: "message",
                rows: 4,
                class: "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
              )
            ])
          end,
          content_tag(:button, "Submit",
            type: "submit",
            class: "flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          )
        ])
      end
    end
  end

  # Form with validation errors
  def with_errors
    render Forms::BaseComponent.new do
      content_tag(:form, class: "space-y-6") do
        safe_join([
          content_tag(:div) do
            safe_join([
              content_tag(:label, "Email", for: "email", class: "block text-sm font-medium leading-6 text-gray-900"),
              content_tag(:input, "",
                type: "email",
                id: "email",
                name: "email",
                class: "block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-red-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-red-600 sm:text-sm sm:leading-6"
              ),
              content_tag(:p, "Please enter a valid email address", class: "mt-2 text-sm text-red-600")
            ])
          end,
          content_tag(:button, "Submit",
            type: "submit",
            class: "flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          )
        ])
      end
    end
  end
end
