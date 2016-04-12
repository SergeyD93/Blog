class AddUserToArticle < ActiveRecord::Migration
  def change
    add_foreign_key :articles, :user, index: true, foreign_key: true
  end
end
