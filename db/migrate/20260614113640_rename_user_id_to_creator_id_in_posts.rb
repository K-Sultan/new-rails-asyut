class RenameUserIdToCreatorIdInPosts < ActiveRecord::Migration[8.1]
  def change
    rename_column :posts, :user_id, :creator_id
  end
end
