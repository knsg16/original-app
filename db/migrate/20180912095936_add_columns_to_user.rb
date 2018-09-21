class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :authority, :integer, default: 0
    add_column :users, :username, :string
  end
end
