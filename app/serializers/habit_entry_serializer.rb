class HabitEntrySerializer < ActiveModel::Serializer
  attributes :id, :habit_id, :date, :completed
end