class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_entries, dependent: :destroy

  def calculate_current_streak
    streak = 0
    today = Date.current

    entries_by_date = habit_entries.where("date <= ?", today).order(date: :desc).pluck(:date, :completed)

    entries_by_date.each do |date, completed|
      break unless completed

      if date == today - streak
        streak += 1
      else
        break
      end
    end

    streak
  end

  def calculate_longest_streak
    sorted = habit_entries.where(completed: true).order(:date).pluck(:date)
    return 0 if sorted.empty?

    longest = 1
    current = 1

    sorted.each_cons(2) do |a, b|
      if b == a + 1
        current += 1
        longest = [longest, current].max
      else
        current = 1
      end
    end

    longest
  end
end
