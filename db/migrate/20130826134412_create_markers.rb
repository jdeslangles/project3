class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :name
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :trip

      t.timestamps
    end
    add_index :markers, :trip_id
  end
end
