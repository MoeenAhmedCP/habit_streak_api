module Api
  module V1
    class HabitsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_habit, only: %i[show update destroy]

      def index
        habits = current_user.habits
        render json: habits, each_serializer: HabitSerializer
      end

      def create
        habit = current_user.habits.new(habit_params)
        if habit.save
          render json: habit, serializer: HabitSerializer, status: :created
        else
          render json: { errors: habit.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @habit.update(habit_params)
          render json: @habit, serializer: HabitSerializer
        else
          render json: { errors: @habit.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @habit.destroy
        head :no_content
      end

      private

      def set_habit
        @habit = current_user.habits.find(params[:id])
      end

      def habit_params
        params.require(:habit).permit(:name, :frequency, :goal_type, :archived)
      end
    end
  end
end
