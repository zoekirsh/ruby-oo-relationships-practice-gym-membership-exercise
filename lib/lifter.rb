class Lifter
  attr_reader :name, :lift_total

  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    @@all << self
  end

  def self.all
    @@all
  end

  def memberships
    Membership.all.filter {|membership| membership.lifter == self}
  end

  def gyms
    self.memberships.map {|membership| membership.gym.name}
  end

  def self.average_lift
    self.all.map {|lifter| lifter.lift_total}.sum / self.all.count
  end

  def total_membership_cost
    self.memberships.map {|mem| mem.cost}.sum
  end

  def sign_up (gym, cost)
    Membership.new(self, gym, cost)
  end

end
