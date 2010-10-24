module ForumsHelper
  def new_forum_menu
    content_tag(:div,
      content_tag(:ul,
        content_tag(:li, link_to("Forum list", forums_path))
      ),
    :id => "nav")
  end

  def forum_menu
    content_tag(:div,
      content_tag(:ul,
        [
        content_tag(:li, link_to("Forum list", forums_path)),
        content_tag(:li, link_to("Edit forum", edit_forum_path(@forum))),
        content_tag(:li, link_to("Destroy forum", forum_path(@forum), :method => :delete))
        ].join
      ),
    :id => "nav")
  end

  def forums_menu
    content_tag(:div,
      content_tag(:ul,
        content_tag(:li, link_to("New forum", new_forum_path))
      ),
    :id => "nav")
  end
end
