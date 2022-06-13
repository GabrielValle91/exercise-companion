class ExerciseRoutineExercisesController < ApplicationController
    before_action :auth_user
    before_action :verify_user, only: [:create]

    def new
        @exercise_routine_exercise = ExerciseRoutineExercise.new
        @exercise = Exercise.find_by(id: params[:exercise_id])
    end

    def create
        exercise_count = ExerciseRoutineExercise.where(exercise_routine_id: @exercise_routine.id).size
        @exercise_routine_exercise = ExerciseRoutineExercise.new(exercise_routine_exercise_params)
        @exercise_routine_exercise.exercise_number = exercise_count + 1
        exercise_routine = ExerciseRoutine.find_by(id: @exercise_routine.id)
        
        respond_to do |format|
            if @exercise_routine_exercise.save
                format.html { redirect_back_or_to exercise_routine_path(@exercise_routine), notice: "Exercise was successfully added to routine." }
                format.json { render :show, status: :created, location: @exercise_routine_exercise }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @exercise_routine_exercise.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    private

    def auth_user
        redirect_to new_user_session_path if !user_signed_in?
    end

    def exercise_routine_exercise_params
        params.require(:exercise_routine_exercise).permit(:exercise_routine_id, :exercise_id)
    end

    def set_exercise
        @exercise = Exercise.find_by(id: exercise_routine_exercise_params[:exercise_id])
    end

    def set_exercise_routine
        @exercise_routine = ExerciseRoutine.find_by(id: exercise_routine_exercise_params[:exercise_routine_id])
    end

    def verify_user
        set_exercise_routine
        redirect_back_or_to root_path if !@exercise_routine
        set_exercise
        redirect_back_or_to root_path if !@exercise
        redirect_back_or_to root_path if current_user != @exercise_routine.user
        redirect_back_or_to root_path if !current_user.get_visible_exercises.include?(@exercise)
    end
end