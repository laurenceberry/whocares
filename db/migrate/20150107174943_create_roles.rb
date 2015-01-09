class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.references :profession, index: true
      t.timestamps
    end
  end
end
