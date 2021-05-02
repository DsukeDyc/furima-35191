class CreateAddressBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :address_books do |t|
      t.string :postal_code,       null: false
      t.integer :prefecture_id,    null: false
      t.string :city,              null: false
      t.string :house_number,      null: false
      t.string :building_name,     null: false
      t.references :order, null: false, foreign_key: true
      t.string :tel,               null: false
      t.timestamps
    end
  end
end
