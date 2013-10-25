class AddPasswordDigestToHives < ActiveRecord::Migration
  def change
    add_column :hives, :password_digest, :string
  end
end
