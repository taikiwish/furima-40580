class RenameDateIdColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :date_id, :deliverydate_id
  end
end
