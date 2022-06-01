require "application_system_test_case"

class ExerciseRoutinesTest < ApplicationSystemTestCase
  setup do
    @exercise_routine = exercise_routines(:one)
  end

  test "visiting the index" do
    visit exercise_routines_url
    assert_selector "h1", text: "Exercise routines"
  end

  test "should create exercise routine" do
    visit exercise_routines_url
    click_on "New exercise routine"

    fill_in "Description", with: @exercise_routine.description
    fill_in "Name", with: @exercise_routine.name
    fill_in "User", with: @exercise_routine.user_id
    fill_in "Visibility", with: @exercise_routine.visibility
    click_on "Create Exercise routine"

    assert_text "Exercise routine was successfully created"
    click_on "Back"
  end

  test "should update Exercise routine" do
    visit exercise_routine_url(@exercise_routine)
    click_on "Edit this exercise routine", match: :first

    fill_in "Description", with: @exercise_routine.description
    fill_in "Name", with: @exercise_routine.name
    fill_in "User", with: @exercise_routine.user_id
    fill_in "Visibility", with: @exercise_routine.visibility
    click_on "Update Exercise routine"

    assert_text "Exercise routine was successfully updated"
    click_on "Back"
  end

  test "should destroy Exercise routine" do
    visit exercise_routine_url(@exercise_routine)
    click_on "Destroy this exercise routine", match: :first

    assert_text "Exercise routine was successfully destroyed"
  end
end
