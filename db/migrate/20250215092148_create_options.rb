class CreateOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :options do |option|
      option.timestamps
      option.string :option
      option.boolean :correct
      option.belongs_to :question, null: false, foreign_key: true
      option.string :letter
    end
  end
end
