class ChangeDobtoZodiacSign < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :dob, :zodiac_sign
  end
end
