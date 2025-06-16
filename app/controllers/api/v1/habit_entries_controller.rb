module Api
  module V1
    class HabitEntriesController < ApplicationController
      before_action :set_habit_entry, only: %i[ show update destroy ]

      # GET /habit_entries
      def index
        @habit_entries = HabitEntry.all

        render json: @habit_entries
      end

      # GET /habit_entries/1
      def show
        render json: @habit_entry
      end

      # POST /habit_entries
      def create
        @habit_entry = HabitEntry.new(habit_entry_params)

        if @habit_entry.save
          render json: @habit_entry, status: :created, location: @habit_entry
        else
          render json: @habit_entry.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /habit_entries/1
      def update
        if @habit_entry.update(habit_entry_params)
          render json: @habit_entry
        else
          render json: @habit_entry.errors, status: :unprocessable_entity
        end
      end

      # DELETE /habit_entries/1
      def destroy
        @habit_entry.destroy!
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_habit_entry
          @habit_entry = HabitEntry.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def habit_entry_params
          params.require(:habit_entry).permit(:habit_id, :date, :completed)
        end
    end
  end
end 