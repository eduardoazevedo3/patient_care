class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid, null: false, default: ""

      ## Custom attributes
      t.string :full_name, null: false

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Tokens
      t.json :tokens

      ## Timestamps
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, [:uid, :provider], unique: true
  end
end
