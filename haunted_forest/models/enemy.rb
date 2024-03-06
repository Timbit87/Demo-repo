require './modules/enemy_names'
class Enemy
  # I made a module called enemy names and required it here.
  include Names
  attr_accessor :name, :weapon

  def initialize(name, weapon)
    # If the `name` parameter is provided, assign it to the `@name` instance variable. Otherwise, call the `random_name` class method on the current class (`self.class`) and assign the returned random name to the `@name` instance variable.
    @name = name || self.class.random_name
    @weapon = weapon
    @health = rand(50..100)
  end

  #here we call the list of names and choose a random one. self in this code means Enemy, self here refers to the Class.
  def self.random_name
    Names::ENEMY_NAMES.sample
  end

  def health
    return @health
  end

  def dead?
    @health <= 0
  end

  def take_damage(hit_points)
    @health -= hit_points
  end

  def damage
    @damage = Enemy.weapons.fetch(@weapon)
  end

  def attack(enemy)
    hit_points = Enemy.weapons[@weapon]
    enemy.take_damage(hit_points)
  end

  def crit_attack(enemy)
    hit_points = Enemy.weapons[@weapon]
    enemy.take_damage(hit_points * 2)
  end

  def self.weapons
    {
      'Wicked needle' => 1,
      'Vengeful dagger' => rand(4..7),
      'Savage blade' => rand(8..12),
      'Raging axe' => rand(13..17),
      'Cursed mace' => rand(17..23),
      'Dark soul scythe' => rand(22..28)
    }
  end
end
