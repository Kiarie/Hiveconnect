class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :hive_id

      t.timestamps
    end
	add_index :microposts, [:hive_id, :created_at]
  end
end
