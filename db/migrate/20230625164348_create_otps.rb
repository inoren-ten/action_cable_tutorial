class CreateOtps < ActiveRecord::Migration[7.0]
  def change
    create_table :otps do |t|
      t.string :email, null: false
      t.integer :code, null: false
      t.datetime :expired_at, null: false

      t.timestamps
    end
  end
end
