class CreateHabitEntries < ActiveRecord::Migration[7.1]
  def change
    create_table :habit_entries do |t|
      t.references :habit, null: false, foreign_key: true
      t.date :date
      t.boolean :completed

      t.timestamps
    end
  end
end
