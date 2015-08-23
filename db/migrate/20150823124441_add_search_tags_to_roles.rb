class AddSearchTagsToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :search_tags, :text
  end
end
