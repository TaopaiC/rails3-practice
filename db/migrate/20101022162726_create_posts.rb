class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string     :title
      t.text       :description
      t.references :forum

      t.timestamps
    end
    add_index :posts, :forum_id
  end

  def self.down
    drop_table :posts
  end
end
