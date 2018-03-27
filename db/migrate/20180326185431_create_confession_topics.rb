class CreateConfessionTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :confession_topics do |t|
      t.integer :confession_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
