class RenameIdColumnToCompany < ActiveRecord::Migration
  def change
      rename_column :companies, :id, :company_id
  end
end
