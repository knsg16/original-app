class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :office_id
      t.integer :plan_id
      t.date :start_date
      t.date :end_date
      t.timestamps null: false
    end
  end
end
