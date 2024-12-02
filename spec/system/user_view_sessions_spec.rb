require 'rails_helper'

describe 'Usuário visualiza sessões' do
  it 'se estiver autenticado' do
    visit root_path

    expect(page).not_to have_content('Sessions')
  end

  it 'com sucesso' do
    user = FactoryBot.create(:user, email: 'joao@email.com', password: '123456789')

    movie_theater1 = FactoryBot.create(:movie_theater, name: 'Cine Paradiso')
    movie_theater2 = FactoryBot.create(:movie_theater, name: 'Cine Treinadev')

    movie1 = Movie.create!(title: 'Jurassic Park', year: 1993, director: 'Steven Spielberg',
              plot:  'Um velho maluco revive dinossauros através do dna encontrado em mosquitos.')

    movie2 = Movie.create!(title: 'Jurassic Park 2', year: 1995, director: 'Steven Spielberg',
              plot:  'Na ilha dos dinossauros, pessoas precisam de resgate.')

    room1 = Room.create(movie_theater: movie_theater1, name: 'Sala 1', capacity: 300)
    room2 = Room.create(movie_theater: movie_theater2, name: 'Sala 2', capacity: 250)

    session1 = Session.create(day_of_week: 'Domingo', time: '20:00', room: room1, movie: movie1, movie_theater: movie_theater1)
    session2 = Session.create(day_of_week: 'Domingo', time: '20:00', room: room2, movie: movie2)

    login_as user
    visit root_path
    within('nav') do
      click_on 'Sessões'
    end

    expect(page).to have_content('Seções')
    expect(page).to have_content('Seção 1')
    expect(page).to have_content('Jurassic Park')
    expect(page).to have_content('Steven Spielberg')
    expect(page).to have_content('Um velho maluco revive dinossauros através do dna encontrado em mosquitos.')
    expect(page).to have_content('Seção 2')
    expect(page).to have_content('Jurassic Park 2')
    expect(page).to have_content('Steven Spielberg')
    expect(page).to have_content('Na ilha dos dinossauros, pessoas precisam de resgate.')
  end
end
