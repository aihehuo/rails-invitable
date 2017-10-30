class AddRedPocketColumnOnUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :red_pocket, :decimal, :default => 0.0, :precision => 8, :scale => 2
  end
end
