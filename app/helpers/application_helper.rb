module ApplicationHelper
  def sidebar_link_to(path, emoji, text)
    classes = %w[my-1 nav-link text-white]
    classes << "active" if current_page?(path)

    link_to(path, class: classes) do
      tag.span(class: "me-2") { emoji } + tag.span { text }
    end
  end

  def icon(icon_name)
    tag.i(class: ["bi", "bi-#{icon_name}"])
  end

  def icon_with_text(icon_name, text)
    tag.span(icon(icon_name), class: "me-2") + tag.span(text)
  end
end
