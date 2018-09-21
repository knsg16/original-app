class AddDetailsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :address_prefecture, :string
    add_column :companies, :address_city, :string
    add_column :companies, :address_street_number, :text
    add_column :companies, :address_after, :text
  end
end
