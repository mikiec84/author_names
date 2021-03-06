class CreateFormItems < ActiveRecord::Migration
  def change
    create_table :form_items do |t|
      t.string :field_name, :null => false
      t.text :display_text
      t.string :field_type, :null => false
      t.string :field_options
      t.boolean :required, :default => false
      t.references :publisher
      t.references :form_item_group
      t.timestamps
    end
    
    create_table(:form_items_questionnaires) do|t|
      t.references :form_item
      t.references :questionnaire
      t.integer :position, :null => false, :default => 0
    end
    
    [:field_name, :display_text, :field_type, :field_options].each do|col|
      add_index :form_items, col
    end
  end
end
