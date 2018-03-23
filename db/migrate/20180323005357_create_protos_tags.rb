class CreateProtosTags < ActiveRecord::Migration
  def change
    create_table :protos_tags do |t|
      t.references :prototype, null: false, foreign_key: false
      t.references :tag, null: false, foreign_key: false
      t.timestamps null: false
    end
  end
end
