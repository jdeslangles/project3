class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :bio
      t.date :birthdate
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
