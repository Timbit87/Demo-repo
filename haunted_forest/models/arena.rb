require_relative 'enemy'
class Arena
  attr_accessor :kills, :rounds, :monsters

  def initialize(monsters)
    @monsters = self.class.monsters
    @rounds = self.class.monsters.count
  end

  def self.monsters
    monsters = []
    rand(2..4).times { monsters << Enemy.new(Enemy.random_name, Enemy.weapons.keys.sample) }
    monsters
  end
end
