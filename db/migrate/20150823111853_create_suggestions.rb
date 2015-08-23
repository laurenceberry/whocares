class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.string :suggester
      t.text :description
      t.text :jobs
      t.text :sources
      t.references :role, index: true

      t.timestamps
    end
  end
end
