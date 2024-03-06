class Warrior
  def initialize(name, weapon)
    @name = name
    @weapon = weapon
    @health = 100.0
  end

  def health

    return @health
  end

  def name
    return @name
  end

  attr_reader :weapon
  attr_writer :weapon

  def dead?
    @health <= 0
  end

  def take_damage(hit_points)
    @health -= hit_points
  end

  def damage
    @damage = Warrior.weapons.fetch(@weapon)
  end

  def attack(warrior)
    hit_points = Warrior.weapons[@weapon]
    warrior.take_damage(hit_points)
  end

  def critattack(warrior)
    hit_points = Warrior.weapons[@weapon]
    warrior.take_damage(hit_points * 2)
  end

  def self.weapons
    {
      'sling shot' => 1,
      'shiv' => rand(4..7),
      'katana' => rand(8..12),
      'battleaxe' => rand(13..17),
      'Giant Club' => rand(17..23),
      'Buster Sword' => rand(22..28)
    }
  end
end

class Mage
  def initialize(name, weapon)
    @name = name
    @weapon = weapon
    @health = 50.0
  end

  def health
    return @health
  end

  def name
    return @name
  end

  attr_reader :weapon
  attr_writer :weapon

  def dead?
    @health <= 0
  end

  def take_damage(hit_points)
    @health -= hit_points
  end

  def damage
    @damage = Mage.weapons.fetch(@weapon)
  end

  def attack(mage)
    hit_points = Mage.weapons[@weapon]
    mage.take_damage(hit_points)
  end
  
  def critattack(mage)
    hit_points = Mage.weapons[@weapon]
    mage.take_damage(hit_points * 2)
  end

  def self.weapons
    {
      'spell that fizzles!' => 1,
      'Magic Missile' => rand(5..14),
      'Dragons Breath' => rand(10..20),
      'Ice Spear' => rand(13..22),
      'Thunderbolt' => rand(20..28),
      'Disintegrate' => rand(28..31),
      'Meteor Strike' => rand(30..35)
    }
  end
end

class Rogue
  def initialize(name, weapon)
    @name = name
    @weapon = weapon
    @health = 75.0
  end

  def health
    return @health
  end

  def name
    return @name
  end

  attr_reader :weapon
  attr_writer :weapon

  def dead?
    @health <= 0.0
  end

  def take_damage(hit_points)
    @health -= hit_points
  end

  def attack(rogue)
    hit_points = Rogue.weapons[@weapon]
    rogue.take_damage(hit_points)
  end
  
  def offhandattack(rogue)
    hit_points = Rogue.weapons[@weapon]
    rogue.take_damage(hit_points / 2)
    # Araki said hit_points2 = hit_points / 2
    # rogue.take_damage(hit_points2)
  end
  
  def damage
    hit_points = Rogue.weapons.fetch(@weapon)
  end

  def critattack(rogue)
    hit_points = Rogue.weapons[@weapon]
    rogue.take_damage(hit_points * 2)
  end

  def self.weapons
    {
      'Pocket Sand' => 1,
      'Shiv' => rand(4..7),
      'Dirk' => rand(7..9),
      'Kriss' => rand(9..11),
      'Short Sword' => rand(10..13),
      'Dagger' => rand(6..8)
    }
  end
end