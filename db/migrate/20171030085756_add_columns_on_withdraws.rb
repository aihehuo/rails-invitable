class AddColumnsOnWithdraws < ActiveRecord::Migration[5.1]
  def change
    add_column :withdraws, :order_no, :string, index: true
  end
end
