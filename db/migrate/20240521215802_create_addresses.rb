class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :zipcode, null: false
      t.integer :area_id, null: false
      t.string :city, null: false
      t.string :number, null: false
      t.string :building
      t.string :phone, null: false
      t.references :purchase, null: false, foreign_key: true

      t.timestamps
    end
  end
end