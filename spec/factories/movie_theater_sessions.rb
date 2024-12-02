FactoryBot.define do
  factory :movie_theater_session do
    movie_theater { nil }
    session { nil }
    room { nil }
    movie { nil }
  end
end
