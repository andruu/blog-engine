class RenameTypeToPageTypeInPages < ActiveRecord::Migration
  def change
    rename_column :pages, :type, :page_type
  end
end
