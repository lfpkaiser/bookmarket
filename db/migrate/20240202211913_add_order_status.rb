class AddOrderStatus < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :status, :boolean
  end
end
