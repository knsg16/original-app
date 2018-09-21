class AddNameToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :office_name, :string
  end
end
