# == Schema Information
#
# Table name: forums
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Forum < ActiveRecord::Base
  has_many :posts, :autosave => true, :dependent => :destroy
  validates_presence_of :title
end
