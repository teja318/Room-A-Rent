class CreateAmenityRooms < ActiveRecord::Migration
  def change
    create_table :amenity_rooms do |t|
      t.integer :room_id
      t.integer :amenity_id

      t.timestamps null: false
    end
  end
end
