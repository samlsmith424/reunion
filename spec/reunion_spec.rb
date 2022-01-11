require './lib/reunion'
require './lib/activity'

RSpec.describe Reunion do

  let(:reunion) {Reunion.new("1406 BE")}
  let(:activity_1) {Activity.new("Brunch")}

  it 'exists' do
    expect(reunion).to be_a(Reunion)
  end

  it 'has attributes' do
    expect(reunion.name).to eq("1406 BE")
    expect(reunion.activities).to eq([])
  end

  it '#add_activity' do
    reunion.add_activity(activity_1)
    expect(reunion.activities).to eq([activity_1])
  end

  describe 'iteration 3' do
  let(:activity_2) {Activity.new("Drinks")}

  it 'can add more activiites' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)
    expect(reunion.total_cost).to eq(60)

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expect(reunion.total_cost).to eq(180)
  end

  it '#breakout' do
    activity_1.add_participant("Maria", 20)
    activity_1.add_participant("Luther", 40)
    reunion.add_activity(activity_1)

    activity_2.add_participant("Maria", 60)
    activity_2.add_participant("Luther", 60)
    activity_2.add_participant("Louis", 0)
    reunion.add_activity(activity_2)
    expect(reunion.breakout).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    expect(reunion.summary).to eq("Maria: -10\nLuther: -30\nLouis: 40")
  end
  end
end
