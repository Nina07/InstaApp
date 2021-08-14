class AddUserIdToPost < ActiveRecord::Migration[6.1]
  def up
    add_reference :posts, :user
  end

  def down
    remove_column :posts, :user_id_id
  end
end
