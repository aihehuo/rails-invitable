class CreateRailsInvitableUserAcceptedReferrals < ActiveRecord::Migration
  def change
    create_table :rails_invitable_user_accepted_referrals do |t|
      t.integer :user_id
      t.integer :referral_id, null: false
      t.datetime :registered_at
      t.datetime :completed_at
      t.string :phone, null: false, unique: true

      t.timestamps
    end
    add_index :rails_invitable_user_accepted_referrals, :user_id
    add_index :rails_invitable_user_accepted_referrals, :referral_id
    add_index :rails_invitable_user_accepted_referrals, :phone
  end
end
