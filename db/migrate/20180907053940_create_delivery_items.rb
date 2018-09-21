class CreateDeliveryItems < ActiveRecord::Migration
  def change
    create_table :delivery_items do |t|
      t.references :delivery, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.integer :amount

      t.timestamps null: false
    end
  end
end
