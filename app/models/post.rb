# == Schema Information
#
# Table name: posts
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  forum_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_posts_on_forum_id  (forum_id)
#

class Post < ActiveRecord::Base
  belongs_to :forum
end
