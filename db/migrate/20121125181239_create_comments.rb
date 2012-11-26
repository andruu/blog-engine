class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :url
      t.string :comment
      t.integer :page_id

      t.timestamps
    end
  end
end
