class AddCommentsCountToPages < ActiveRecord::Migration
  def change
    add_column :pages, :comments_count, :integer
  end
end
