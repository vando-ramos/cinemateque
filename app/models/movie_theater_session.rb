class MovieTheaterSession < ApplicationRecord
  belongs_to :movie_theater
  belongs_to :session
  belongs_to :room
  belongs_to :movie
end
