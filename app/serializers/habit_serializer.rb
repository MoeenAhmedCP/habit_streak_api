class HabitSerializer < ActiveModel::Serializer
  attributes :id, :name, :frequency, :goal_type, :archived
  has_one :user
end
