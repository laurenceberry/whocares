class AddImageToConditions < ActiveRecord::Migration
  def up
    add_attachment :conditions, :image
  end

  def down
    remove_attachment :conditions, :image
  end
end
