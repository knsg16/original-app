class AddColumnToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :applicated_date, :date
  end
end
