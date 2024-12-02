class CreateSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :sessions do |t|
      t.integer :day_of_week
      t.time :time

      t.timestamps
    end
  end
end
