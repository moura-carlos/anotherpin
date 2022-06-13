class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.references :order, null: true, foreign_key: true
      t.references :product, null: true, foreign_key: true

      t.timestamps
    end
  end
end
