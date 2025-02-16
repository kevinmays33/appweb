class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |user|
      user.string :provider
      user.string :uid
    end
  end
end
