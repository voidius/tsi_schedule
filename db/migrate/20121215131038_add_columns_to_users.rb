class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :url, :text
    add_column :users, :provider, :string
    add_column :users, :username, :text
    add_column :users, :nickname, :text
  end
end
