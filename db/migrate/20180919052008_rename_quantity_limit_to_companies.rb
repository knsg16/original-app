class RenameQuantityLimitToCompanies < ActiveRecord::Migration
  def change
    rename_column :plans, :quantity_limit,      :month_quantity_limit
    add_column    :plans, :once_quantity_limit, :integer
    add_column    :plans, :month_delivery_limit, :integer
  end
end
