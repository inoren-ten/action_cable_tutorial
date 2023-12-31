class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.integer :room_id, null: false
      t.integer :user_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
