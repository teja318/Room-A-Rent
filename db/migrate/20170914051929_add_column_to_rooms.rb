class AddColumnToRooms < ActiveRecord::Migration
  def change
  	add_column :rooms, :is_authorized, :boolean, default: false
  end
end
