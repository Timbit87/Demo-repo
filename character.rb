# Here we create a base char class that every other class will inherit from. Every char class you make will contain everything below plus what is written in their definitions.

class Character
  #accessor acts as getter and setter (read and write)
  attr_accessor :weapon, :health

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
    @health = 100
  end

  def name
    return @name
  end

  def dead?
    @health <= 0
  end

  def take_damage(hit_points)
    @health -= hit_points
  end

  def damage
    @damage = self.class.weapons.fetch(@weapon)
  end

  def attack(character)
    hit_points = self.class.weapons[@weapon]
    character.take_damage(hit_points)
  end

  def crit_attack(character)
    hit_points = self.class.weapons[@weapon]
    character.take_damage(hit_points * 2)
  end
end
