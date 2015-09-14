class ChangeTextFieldsToTextareasForRepeatables < ActiveRecord::Migration
  def change
    remove_column :condition_repeatables, :content

    add_column :condition_repeatables, :content, :text

  end
end
