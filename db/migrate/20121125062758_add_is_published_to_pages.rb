class AddIsPublishedToPages < ActiveRecord::Migration
  def change
    add_column :pages, :is_published, :boolean
  end
end
