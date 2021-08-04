require 'rails_helper'
RSpec.describe 'shows and describes a competitions show page' do
  before :each do
    @team1 = Team.create!(hometown: "Tampa Bay", nickname: "Da Bucs")
    @team2 = Team.create!(hometown: "Denver", nickname: "Nuggies")
    @team3 = Team.create!(hometown: "Dallas", nickname: "Americas Team")
    
    @player1 = Player.create!(name: "Devin White", age: 23, team_id: @team1.id)
    @player2 = Player.create!(name: "Lavonte David", age: 31, team_id: @team1.id)
    @player3 = Player.create!(name: "Jamal Murray", age: 24, team_id: @team2.id)
    @player4 = Player.create!(name: "Nikola Jokić", age: 26, team_id: @team2.id)
    @player5 = Player.create!(name: "Amari Cooper", age: 27, team_id: @team3.id)
    @player6 = Player.create!(name: "Ezekiel Elliott", age: 26, team_id: @team3.id)

    @competition1 = Competition.create!(name: "Hoops 4 you", location: "Las Vegas", sport: "Basketball")
    @competition2 = Competition.create!(name: "Pigskin", location: "Denver", sport: "Football")
    @competition3 = Competition.create!(name: "WEIGHTS", location: "Muscle Beach", sport: "Weight Lifting")
    @competition4 = Competition.create!(name: "Call of Duty", location: "Mom's Basement", sport: "E Sports")

    @event1 = Event.create!(team_id: @team1.id, competition_id: @competition1.id)
    @event2 = Event.create!(team_id: @team1.id, competition_id: @competition2.id)
    @event3 = Event.create!(team_id: @team1.id, competition_id: @competition4.id)
    @event4 = Event.create!(team_id: @team3.id, competition_id: @competition3.id)
    @event5 = Event.create!(team_id: @team3.id, competition_id: @competition4.id)
    @event6 = Event.create!(team_id: @team2.id, competition_id: @competition1.id)

    visit "/competitions/#{@competition1.id}"
  end
  it 'can show the attributes of the competitons on its show page' do
    expect(page).to have_content(@competition1.name)
    expect(page).to have_content(@competition1.location)
    expect(page).to have_content(@competition1.sport)

    expect(page).to_not have_content(@competition2.name)
    expect(page).to_not have_content(@competition2.location)
    expect(page).to_not have_content(@competition2.sport)
  end

  it '' do
    
  end
end