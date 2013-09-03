class AddPhotoToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :photo, :string
  end
end
