class AddSuccessOnWithdraws < ActiveRecord::Migration[5.1]
  def change
    add_column :rails_invitable_withdraws, :success, :boolean, default: false
  end
end
