class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post, null: false, foreign_key: true
      t.string :author, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
