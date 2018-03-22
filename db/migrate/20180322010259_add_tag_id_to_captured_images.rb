class AddTagIdToCapturedImages < ActiveRecord::Migration
  def change
    add_column :captured_images, :tag_id, :integer, null: false, foreign_key: true
  end
end
