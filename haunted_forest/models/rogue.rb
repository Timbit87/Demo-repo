#this hasn't actually changed from your original logic, i just moved things around
require_relative 'character'

#here we inherit from Character class. We now have acces to all methods within the Character class.
class Rogue < Character
  def offhand_attack(character)
    hit_points = self.class.weapons[@weapon]
    character.take_damage(hit_points / 2)
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
