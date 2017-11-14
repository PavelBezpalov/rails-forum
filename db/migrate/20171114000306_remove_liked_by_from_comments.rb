class RemoveLikedByFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :liked_by, :text
  end
end
