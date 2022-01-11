class Reunion
  attr_reader :name,
              :activities,
              :total_cost

  def initialize(name)
    @name = name
    @activities = []
    @total_cost = 0
  end

  def add_activity(activity)
    @activities << activity
    @total_cost += activity.total_cost
  end

  def breakout
    breakout = Hash.new
    @activities.each do |activity|
      activity.owed.each_pair do |name, amount|
        if breakout[name].nil?
          breakout[name] = amount
        else
          breakout[name] += amount
        end
      end
    end
    breakout
  end

  def summary
    string = ""
    breakout.each do |name, amount|
      string += "#{name}: #{amount}\n"
    end
    string.chop
  end
end
