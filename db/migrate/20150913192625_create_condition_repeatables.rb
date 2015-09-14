class CreateConditionRepeatables < ActiveRecord::Migration
  def change
    create_table :condition_repeatables do |t|
      t.string :name
      t.string :content
      t.belongs_to :condition, index: true

      t.timestamps
    end
  end
end
