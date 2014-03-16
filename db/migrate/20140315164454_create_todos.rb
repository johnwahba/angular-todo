class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.integer :user_id
      t.string :text
      t.date :due_date
      t.integer :priority
      t.boolean :complete
      t.timestamps
    end
  end
end
