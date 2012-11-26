class AddSearchIndexToPages < ActiveRecord::Migration
  def up
    execute "create index pages_title on pages using gin(to_tsvector('english', title))"
    execute "create index pages_body on pages using gin(to_tsvector('english', body))"
  end

  def down
    execute "drop index articles_name"
    execute "drop index pages_body"
  end
end
