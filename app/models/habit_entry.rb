class HabitEntry < ApplicationRecord
  belongs_to :habit

  validates :date, uniqueness: { scope: :habit_id }
end
