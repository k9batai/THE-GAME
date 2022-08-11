class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :introduction
      t.integer :end_user_id

      t.timestamps
    end
  end
end
