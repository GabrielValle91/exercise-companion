class ExerciseRoutinesController < ApplicationController
    before_action :auth_user
    before_action :check_user_visibility, only: [:show]
    before_action :verify_user, only: [:edit, :update, :destroy]

    # GET /exercise_routines or /exercise_routines.json
    def index
        @exercise_routines = current_user.get_visible_exercise_routines
    end

    # GET /exercise_routines/1 or /exercise_routines/1.json
    def show
    end

    # GET /exercise_routines/new
    def new
        @exercise_routine = ExerciseRoutine.new
    end

    # GET /exercise_routines/1/edit
    def edit
    end

    # POST /exercise_routines or /exercise_routines.json
    def create
        @exercise_routine = ExerciseRoutine.new(exercise_routine_params)
        @exercise_routine.user = current_user

        respond_to do |format|
        if @exercise_routine.save
            format.html { redirect_to exercise_routine_url(@exercise_routine), notice: "Exercise routine was successfully created." }
            format.json { render :show, status: :created, location: @exercise_routine }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @exercise_routine.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /exercise_routines/1 or /exercise_routines/1.json
    def update
        respond_to do |format|
        if @exercise_routine.update(exercise_routine_params)
            format.html { redirect_to exercise_routine_url(@exercise_routine), notice: "Exercise routine was successfully updated." }
            format.json { render :show, status: :ok, location: @exercise_routine }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @exercise_routine.errors, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /exercise_routines/1 or /exercise_routines/1.json
    def destroy
        @exercise_routine.destroy

        respond_to do |format|
        format.html { redirect_to exercise_routines_url, notice: "Exercise routine was successfully destroyed." }
        format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise_routine
        @exercise_routine = ExerciseRoutine.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def exercise_routine_params
        params.require(:exercise_routine).permit(:name, :description, :visibility)
    end

    def auth_user
        redirect_to new_user_session_path if !user_signed_in?
    end

    def verify_user
        set_exercise_routine
        redirect_to root_path if @exercise_routine.user != current_user
    end

    def check_user_visibility
        set_exercise_routine
        redirect_back_or_to root_path if !current_user.get_visible_exercise_routines.include?(@exercise_routine)
    end
end
