class CreateRailsInvitableWithdraws < ActiveRecord::Migration
  def change
    create_table :rails_invitable_withdraws do |t|
      t.decimal :amount, default: 0.0, precision: 8, scale: 2, null: false
      t.integer :user_id, null: false
      t.text :transfer, null: false
      t.text :response
      t.integer :channel, null: false
      t.string :order_no, null: false

      t.timestamps
    end
    add_index :rails_invitable_withdraws, :user_id
    add_index :rails_invitable_withdraws, :order_no
  end
end
