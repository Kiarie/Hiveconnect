class CreateHives < ActiveRecord::Migration
  def change
    create_table :hives do |t|
      t.string :name
      t.text :Body
      
      t.timestamps
    end
  end
end
