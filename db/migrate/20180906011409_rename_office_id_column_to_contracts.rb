class RenameOfficeIdColumnToContracts < ActiveRecord::Migration
  def change
    rename_column :contracts, :office_id, :company_id
  end
end
