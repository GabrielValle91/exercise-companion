json.extract! exercise_routine, :id, :name, :description, :visibility, :user_id, :created_at, :updated_at
json.url exercise_routine_url(exercise_routine, format: :json)
