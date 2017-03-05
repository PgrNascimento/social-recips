class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :mail
      t.string :password
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
