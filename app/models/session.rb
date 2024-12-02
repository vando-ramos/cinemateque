class Session < ApplicationRecord
  has_many :movie_theater_session
  has_many :rooms, through: :movie_theater_session

  has_many :movies, through: :movie_theater_session

  has_many :movie_theaters, through: :movie_theater_session

  # enum day_of_week: { domingo: 0, segunda_feira: 1, terca_feira: 2, quarta_feira: 3, quinta_feira: 4, sexta_feira: 5, sabado: 6 }
end
