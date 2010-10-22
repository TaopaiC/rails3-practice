module ForumsHelper
  def new_forum_menu
    menu = <<-end_src
<div id="nav">
  <ul>
    <li>#{ link_to "Forum list", forums_path }</li>
  </ul>
</div>
    end_src
    menu.html_safe
  end

  def forum_menu
    menu = <<-end_src
<div id="nav">
  <ul>
    <li>#{ link_to "Forum list", forums_path }</li>
    <li>#{ link_to "Edit forum", edit_forum_path(@forum) }</li>
    <li>#{ link_to "Destroy forum", forum_path(@forum), :method => :delete }</li>
  </ul>
</div>
    end_src
    menu.html_safe
  end

  def forums_menu
    menu = <<-end_src
<div id="nav">
  <ul>
    <li>#{ link_to "New Forum", new_forum_path }</li>
  </ul>
</div>
    end_src
    menu.html_safe
  end
end
