class RemoveUserAndCommenterFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user, :reference
    remove_column :comments, :commenter, :string
  end
end
