class HabitSerializer < ActiveModel::Serializer
  attributes :id, :name, :frequency, :goal_type, :archived, :current_streak, :longest_streak

  def current_streak
    object.calculate_current_streak
  end

  def longest_streak
    object.calculate_longest_streak
  end
end
