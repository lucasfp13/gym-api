class V1::ExercisesController < ApplicationController

  before_action :set_exercise, only: %i[show update destroy]

  def index
    @exercises = Exercise.all

    render json: ExerciseSerializer.new(@exercises).serialized_json, status: :ok
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render json: ExerciseSerializer.new(@exercise).serialized_json, status: :created
    else
      render json: { errors: @exercise.errors.full_messages }, status: 422
    end
  end

  def show
    render json: ExerciseSerializer.new(@exercise).serialized_json, status: :ok
  end

  def update
    if @exercise.update(exercise_params)
      render json: ExerciseSerializer.new(@exercise).serialized_json, status: :ok
    else
      render json: { errors: @exercise.errors.full_messages }, status: 422
    end
  end

  def destroy
    if @exercise.destroy
      head(:ok)
    else
      render json: { errors: @exercise.errors.full_messages }, status: 422
    end
  end

  private

  def set_exercise
    @exercise = Exercise.find_by(id: params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:id, :name, :calories, :date, :duration, :image)
  end
end
