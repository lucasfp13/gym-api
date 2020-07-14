class CreateExercises < ActiveRecord::Migration[6.0]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :calories
      t.integer :duration

      t.timestamps
    end
  end
end
