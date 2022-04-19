class ChangeZodiacSigntoString < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :zodiac_sign, :string
  end
end
