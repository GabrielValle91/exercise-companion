class ExercisesController < ApplicationController
    before_action :auth_user
    before_action :check_user_visibility, only: [:show]
    before_action :verify_user, only: [:edit, :update]

    # GET /exercises or /exercises.json
    def index
        @exercises = current_user.get_visible_exercises
    end

    # GET /exercises/1 or /exercises/1.json
    def show
    end

    # GET /exercises/new
    def new
        @exercise = Exercise.new
    end

    # GET /exercises/1/edit
    def edit
    end

    # POST /exercises or /exercises.json
    def create
        @exercise = Exercise.new(exercise_params)
        @exercise.user = current_user

        respond_to do |format|
        if @exercise.save
            format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully created." }
            format.json { render :show, status: :created, location: @exercise }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @exercise.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /exercises/1 or /exercises/1.json
    def update
        respond_to do |format|
        if @exercise.update(exercise_params)
            format.html { redirect_to exercise_url(@exercise), notice: "Exercise was successfully updated." }
            format.json { render :show, status: :ok, location: @exercise }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @exercise.errors, status: :unprocessable_entity }
            format.turbo_stream { render :form_update, status: :unprocessable_entity }
        end
        end
    end

    # DELETE /exercises/1 or /exercises/1.json
    def destroy
        @exercise.destroy

        respond_to do |format|
        format.html { redirect_to exercises_url, notice: "Exercise was successfully destroyed." }
        format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
        @exercise = Exercise.find_by(id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exercise_params
        params.require(:exercise).permit(:name, :description, :visibility, :exercise_type)
    end

    def auth_user
        redirect_to new_user_session_path if !user_signed_in?
    end

    def verify_user
        set_exercise
        redirect_to root_path if @exercise.user != current_user
    end

    def check_user_visibility
        set_exercise
        redirect_to root_path if !current_user.get_visible_exercises.include?(@exercise)
    end
end
