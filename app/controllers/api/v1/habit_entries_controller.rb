module Api
  module V1
    class HabitEntriesController < ApplicationController
      before_action :authenticate_user!
      before_action :set_habit, only: %i[index create]
      before_action :set_entry, only: %i[update]

      def index
        entries = @habit.habit_entries.order(date: :desc)
        render json: entries, each_serializer: HabitEntrySerializer
      end

      def create
        entry = @habit.habit_entries.find_or_initialize_by(date: entry_params[:date])
        entry.completed = entry_params[:completed]

        if entry.save
          render json: entry, serializer: HabitEntrySerializer, status: :created
        else
          render json: { errors: entry.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @entry.update(entry_params)
          render json: @entry, serializer: HabitEntrySerializer
        else
          render json: { errors: @entry.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_habit
        @habit = current_user.habits.find(params[:habit_id])
      end

      def set_entry
        @entry = HabitEntry.find(params[:id])
      end

      def entry_params
        params.require(:habit_entry).permit(:date, :completed)
      end
    end
  end
end
