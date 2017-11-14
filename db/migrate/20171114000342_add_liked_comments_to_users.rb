class AddLikedCommentsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :liked_comments, :text
  end
end
