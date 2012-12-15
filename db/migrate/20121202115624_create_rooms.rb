class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :code
      t.string  :name

      t.timestamps
    end

    add_index :rooms, [:code, :name]
  end
end
