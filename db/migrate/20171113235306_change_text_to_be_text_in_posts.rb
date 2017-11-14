class ChangeTextToBeTextInPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :text, :text
  end
end
