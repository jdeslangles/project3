class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :description
      t.references :marker
      t.string :photo_picture

      t.timestamps
    end
    add_index :photos, :marker_id
  end
end
