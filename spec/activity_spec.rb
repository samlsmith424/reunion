require './lib/activity'
require './lib/reunion'

RSpec.describe Activity do
  let(:activity) {Activity.new("Brunch")}

  it 'exists' do
    expect(activity).to be_a(Activity)
  end

  it 'has attributes' do
    expect(activity.name).to eq("Brunch")
    expect(activity.participants).to eq({})
  end

  it '#add_participant' do
    activity.add_participant("Maria", 20)
    expect(activity.participants).to eq({"Maria" => 20})
  end

  it '#total_cost' do
    activity.add_participant("Maria", 20)
    expect(activity.total_cost).to eq(20)
  end

  it 'can add more participants' do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expect(activity.participants).to eq({"Maria" => 20, "Luther" => 40})
    expect(activity.total_cost).to eq(60)
  end

  it '#split payment between participants' do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expect(activity.total_cost).to eq(60)
    expect(activity.split).to eq(30)
  end

  it '#owe the difference from payment and split' do
    activity.add_participant("Maria", 20)
    activity.add_participant("Luther", 40)
    expect(activity.owed).to eq({"Maria" => 10, "Luther" => -10})
  end
end
