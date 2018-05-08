class DropEmail < ActiveRecord::Migration[5.1]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :username, null: false
      t.timestamps
    end
  end
end
