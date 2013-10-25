class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  add_index :hives, :email, unique: true
  end
end
