class RemoveLikedCommentsFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :liked_comments, :text
  end
end
