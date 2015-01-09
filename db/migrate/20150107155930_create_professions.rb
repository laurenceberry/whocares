class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|

      t.string :name
      t.text :description
    end
  end
end
