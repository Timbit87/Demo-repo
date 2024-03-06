#this hasn't actually changed from your original logic, i just moved things around
require_relative 'character'

#here we inherit from Character class. We now have acces to all methods within the Character class.
class Warrior < Character
  def self.weapons
    {
      'Sling Shot' => 1,
      'Shiv' => rand(4..7),
      'Katana' => rand(8..12),
      'Battleaxe' => rand(13..17),
      'Giant Club' => rand(17..23),
      'Buster Sword' => rand(22..28)
    }
  end
end
