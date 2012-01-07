class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :entry
      t.date :due_date
      t.integer :todo_list_id
      t.boolean :complete

      t.timestamps
    end
  end
end
