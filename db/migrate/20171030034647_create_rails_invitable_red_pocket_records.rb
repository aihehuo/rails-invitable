class CreateRailsInvitableRedPocketRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :rails_invitable_red_pocket_records do |t|
      t.references :referable, polymorphic: true, index: {:name => "index_referable"}, unique: true
      t.decimal :amount, default: 0.0, precision: 8, scale: 2, null: false
      t.boolean :incoming, default: true, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :rails_invitable_red_pocket_records, :user_id
  end
end
