class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :code
      t.string  :name

      t.timestamps
    end

    add_index :groups, [:code, :name]
  end
end
