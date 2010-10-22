module PostsHelper
  def new_post_menu
    menu = <<-end_src
<div id="nav">
  <ul>
    <li>#{ link_to "Post list", forum_posts_path(@forum) }</li>
  </ul>
</div>
    end_src
    menu.html_safe
  end

  def post_menu
    menu = <<-end_src
<div id="nav">
  <ul>
    <li>#{ link_to "Post list", forum_posts_path(@forum) }</li>
    <li>#{ link_to "Edit Post", edit_forum_post_path(@forum, @post) }</li>
    <li>#{ link_to "Destroy Post", forum_post_path(@forum, @post), :method => :delete }</li>
  </ul>
</div>
    end_src
    menu.html_safe
  end

  def posts_menu
    menu = <<-end_src
<div id="nav">
  <ul>
    <li>#{ link_to "Forum list", forums_path }</li>
    <li>#{ link_to "Edit forum", edit_forum_path(@forum) }</li>
    <li>#{ link_to "Destroy forum", forum_path(@forum), :method => :delete }</li>
    <li>#{ link_to "New Post", new_forum_post_path(@forum) }</li>
  </ul>
</div>
    end_src
    menu.html_safe
  end
end
