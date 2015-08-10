class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :mail
      t.text :comment

      t.timestamps null: false
    end
  end
end
