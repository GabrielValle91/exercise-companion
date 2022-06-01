require "test_helper"

class ExerciseRoutinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_routine = exercise_routines(:one)
  end

  test "should get index" do
    get exercise_routines_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_routine_url
    assert_response :success
  end

  test "should create exercise_routine" do
    assert_difference("ExerciseRoutine.count") do
      post exercise_routines_url, params: { exercise_routine: { description: @exercise_routine.description, name: @exercise_routine.name, user_id: @exercise_routine.user_id, visibility: @exercise_routine.visibility } }
    end

    assert_redirected_to exercise_routine_url(ExerciseRoutine.last)
  end

  test "should show exercise_routine" do
    get exercise_routine_url(@exercise_routine)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_routine_url(@exercise_routine)
    assert_response :success
  end

  test "should update exercise_routine" do
    patch exercise_routine_url(@exercise_routine), params: { exercise_routine: { description: @exercise_routine.description, name: @exercise_routine.name, user_id: @exercise_routine.user_id, visibility: @exercise_routine.visibility } }
    assert_redirected_to exercise_routine_url(@exercise_routine)
  end

  test "should destroy exercise_routine" do
    assert_difference("ExerciseRoutine.count", -1) do
      delete exercise_routine_url(@exercise_routine)
    end

    assert_redirected_to exercise_routines_url
  end
end
