class CreateConfessions < ActiveRecord::Migration[5.1]
  def change
    create_table :confessions do |t|
      t.string :title
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
