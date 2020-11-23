class Gym
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.filter {|membership| membership.gym == self}
  end

  def lifters 
    self.memberships.map {|membership| membership.lifter}
  end

  def lifter_names
    self.lifters.map {|lifter| lifter.name}
  end

  def combined_lift_totals
    self.lifters.map {|lifter| lifter.lift_total}.sum
  end

end
