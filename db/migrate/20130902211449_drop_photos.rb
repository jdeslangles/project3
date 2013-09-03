class DropPhotos < ActiveRecord::Migration
  def up
    #drop_table :photos
  end

  def down
    # create_table "photos", :force => true do |t|
    #   t.string   "name"
    #   t.text     "description"
    #   t.integer  "marker_id"
    #   t.string   "photo_picture"
    #   t.datetime "created_at",    :null => false
    #   t.datetime "updated_at",    :null => false
    # end

    # add_index "photos", ["marker_id"], :name => "index_photos_on_marker_id"
  end
end