class CreateConditionsRoles < ActiveRecord::Migration
  def change
    create_table :conditions_roles do |t|
      t.belongs_to :role
      t.belongs_to :condition
    end
  end
end
