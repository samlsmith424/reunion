class Activity
  attr_reader :name,
              :participants,
              :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, payment)
    @total_cost += payment
    @participants[name] = payment
    # if @participants[name].nil?
    #   @participants[name] = payment
    # else
    #   @participants[name] += payment
    # end
  end

  def total_cost
     @participants.values.sum
  end

  def split
    total_cost / @participants.keys.size
  end

  def owed
    owe = Hash.new
    @participants.each_pair do |name, payment|
      owe[name] = split - payment
    end
    owe
  end
end
