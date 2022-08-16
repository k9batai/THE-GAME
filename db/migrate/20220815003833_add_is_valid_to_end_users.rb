class AddIsValidToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :is_valid, :boolean, default: true
  end
end
