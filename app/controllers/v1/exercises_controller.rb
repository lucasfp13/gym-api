class V1::ExercisesController < ApplicationController

  before_action :set_exercise, only: %i[show update destroy]

  def index
    @exercises = Exercise.all

    render json: @exercises, status: :ok
  end

  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render json: @exercise, status: :created
    else
      head(:unprocessable_entity)
    end
  end

  def show
    render json: @exercise, status: :ok
  end

  def update
    if @exercise.update(exercise_params)
      render json: @exercise, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def destroy
    if @exercise.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
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
