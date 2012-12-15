class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :code
      t.string  :name

      t.timestamps
    end

    add_index :teachers, [:code, :name]
  end
end
