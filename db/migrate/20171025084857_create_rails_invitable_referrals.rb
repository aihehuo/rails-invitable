class CreateRailsInvitableReferrals < ActiveRecord::Migration
  def change
    create_table :rails_invitable_referrals do |t|
      t.string :code, unique: true
      t.integer :user_id

      t.timestamps
    end
    add_index :rails_invitable_referrals, :code
    add_index :rails_invitable_referrals, :user_id
  end
end
