class RemoveTagIdToCapturedImages < ActiveRecord::Migration
  def change
    remove_column :captured_images, :tag_id, :string
  end
end
