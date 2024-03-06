require_relative 'character'

#here we inherit from Character class. We now have acces to all methods within the Character class.
class Mage < Character
  def self.weapons
    {
      'Spell that fizzles!' => 1,
      'Magic Missile' => rand(5..14),
      'Dragon\'s Breath' => rand(10..20),
      'Ice Spear' => rand(13..22),
      'Thunderbolt' => rand(20..28),
      'Disintegrate' => rand(28..31),
      'Meteor Strike' => rand(30..35)
    }
  end
end
