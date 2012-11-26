class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :has_comments

      t.timestamps
    end
  end
end
