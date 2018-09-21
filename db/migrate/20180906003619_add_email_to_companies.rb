class AddEmailToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :office_name, :string
    add_column :companies, :contact_person, :string
    add_column :companies, :email, :string
    add_column :companies, :tel, :string
    add_column :companies, :postcode, :string
    add_column :companies, :address, :string
  end
end
