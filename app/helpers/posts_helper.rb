module PostsHelper
  def new_post_menu
    content_tag(:div,
      content_tag(:ul,
        content_tag(:li, link_to("Post list", forum_posts_path(@forum)))
      ),
    :id => "nav")
  end

  def post_menu
    content_tag(:div,
      content_tag(:ul,
        [
        content_tag(:li, link_to("Post list", forum_posts_path(@forum))),
        content_tag(:li, link_to("Edit post", edit_forum_post_path(@forum, @post))),
        content_tag(:li, link_to("Destroy post", forum_post_path(@forum, @post), :method => :delete))
        ].join
      ),
    :id => "nav")
  end

  def posts_menu
    content_tag(:div,
      content_tag(:ul,
        [
        content_tag(:li, link_to("Forum list", forums_path)),
        content_tag(:li, link_to("Edit forum", edit_forum_path(@forum))),
        content_tag(:li, link_to("Destroy forum", forum_path(@forum), :method => :delete)),
        content_tag(:li, link_to("New post", new_forum_post_path(@forum))),
        ].join
      ),
    :id => "nav")
  end
end
