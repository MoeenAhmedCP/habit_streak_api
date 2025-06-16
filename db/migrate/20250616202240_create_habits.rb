class CreateHabits < ActiveRecord::Migration[7.1]
  def change
    create_table :habits do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :frequency
      t.string :goal_type
      t.boolean :archived

      t.timestamps
    end
  end
end
