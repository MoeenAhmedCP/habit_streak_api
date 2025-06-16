class HabitEntrySerializer < ActiveModel::Serializer
  attributes :id, :date, :completed
  has_one :habit
end
