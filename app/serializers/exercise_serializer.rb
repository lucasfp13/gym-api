class ExerciseSerializer
  include FastJsonapi::ObjectSerializer

  set_type :exercise

  attributes :name, :calories, :created_at

  attribute :duration do |exercise|
    if exercise.duration > 60 && exercise.duration < 120
      "#{exercise.duration / 60} hour and #{exercise.duration % 60} minutes"
    elsif exercise.duration > 60 && exercise.duration > 120
      "#{exercise.duration / 60} hours and #{exercise.duration % 60} minutes"
    else
      "#{exercise.duration} minutes"
    end
  end
end
