class AddAdminToHive < ActiveRecord::Migration
  def change
    add_column :hives, :admin, :boolean, default: false
  end
end
