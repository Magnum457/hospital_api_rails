class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.date :day
      t.datetime :time
      t.references :medic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
