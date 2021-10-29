class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :phone
      t.string :line_id
      t.date :birthday
      t.string :gender
      t.string :zip
      t.string :prefecture
      t.string :address
      t.text :memo
      t.text :customer_note
      t.boolean :vip
      t.boolean :danger
      t.integer :event_id

      t.timestamps
    end
  end
end
