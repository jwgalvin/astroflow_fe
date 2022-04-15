class CreateUser < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.date "date_of_birth"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
