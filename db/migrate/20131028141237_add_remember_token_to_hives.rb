class AddRememberTokenToHives < ActiveRecord::Migration
  def change
   add_column :hives, :remember_token, :string
   add_index :hives, :remember_token
  end
end
