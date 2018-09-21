class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      
      t.integer :contract_id
      t.date :schedule_date
      t.datetime :maintenanced_at
      t.timestamps null: false
    end
  end
end
