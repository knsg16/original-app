class RenameIdColumnToPlan < ActiveRecord::Migration
  def change
        rename_column :plans, :id, :plan_id
  end
end
