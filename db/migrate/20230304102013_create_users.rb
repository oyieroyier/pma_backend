class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :name
      t.string :email, null: false, default: ''
      t.string :passwordHash
      t.string :avatar_url
      t.timestamps
    end
  end
end
