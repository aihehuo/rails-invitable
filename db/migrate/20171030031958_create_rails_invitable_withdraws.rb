class CreateRailsInvitableWithdraws < ActiveRecord::Migration[5.1]
  def change
    create_table :rails_invitable_withdraws do |t|
      t.decimal :amount, default: 0.0, null: false
      t.integer :user_id, null: false
      t.text :transfer, null: false
      t.text :response
      t.integer :channel, null: false

      t.timestamps
    end
    add_index :rails_invitable_withdraws, :user_id
  end
end
