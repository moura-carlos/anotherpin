class RemoveNullConstraintFromCartIdInOrderItems < ActiveRecord::Migration[6.1]
  def change
    change_column :order_items, :cart_id, :integer, null: true
  end
end
