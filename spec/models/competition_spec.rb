require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it { should have_many(:events) }
    it { should have_many(:teams).through(:events) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:) }
  # end

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
    @competition2 = Competition.create!(name: "Pigskin", location: "San Diego", sport: "Football")
    @competition3 = Competition.create!(name: "WEIGHTS", location: "Muscle Beach", sport: "Weight Lifting")
    @competition4 = Competition.create!(name: "Call of Duty", location: "Mom's Basement", sport: "E Sports")

    @event1 = Event.create!(team_id: @team1.id, competition_id: @competition1.id)
    @event2 = Event.create!(team_id: @team1.id, competition_id: @competition2.id)
    @event3 = Event.create!(team_id: @team1.id, competition_id: @competition4.id)
    @event4 = Event.create!(team_id: @team3.id, competition_id: @competition3.id)
    @event5 = Event.create!(team_id: @team3.id, competition_id: @competition4.id)
    @event6 = Event.create!(team_id: @team2.id, competition_id: @competition1.id)
  end

  # describe 'class methods' do
  #  describe '.' do
  #   end
  # end

  describe 'instance methods' do
    describe '#average_age_players' do
      it 'can get the average age of all the players whos teams are in specific competition' do
        expect(@competition1.average_age_players).to eq(26)        
      end
    end
  end
end