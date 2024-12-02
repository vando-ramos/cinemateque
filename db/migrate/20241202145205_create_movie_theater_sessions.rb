class CreateMovieTheaterSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :movie_theater_sessions do |t|
      t.references :movie_theater, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
