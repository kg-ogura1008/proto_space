class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.integer :prototype_id, null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
