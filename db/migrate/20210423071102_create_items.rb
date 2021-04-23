class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :type_id
      t.integer :condition_id
      t.integer :shipping_cost_id
      t.integer :prefecture_id
      t.integer :shipdate_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
