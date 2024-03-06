require_relative 'Haunted_Forest'
require 'active_support'
require 'active_support/core_ext/array/conversions'

#I defined a create player method here but it is the same logic
def create_player(name, role)
  case role
  when "Warrior"
    Warrior.new(name, Warrior.weapons.keys.sample)
  when "Mage"
    Mage.new(name, Mage.weapons.keys.sample)
  when "Rogue"
    Rogue.new(name, Rogue.weapons.keys.sample)
  else
    puts "I'm sorry, I do not understand."
  end
end

#This instance method can be re-used as the arguments passed to the method are dynamic. It expects an attacker and a defender. Attacker might be Rogue class and Defender might be Enemy class
def attack(attacker, defender)
  crit_chance = rand(1..10)
  if crit_chance.between?(8, 10)
    puts "#{attacker.name} lands a critical hit on #{defender.name} with a #{attacker.weapon} for #{attacker.damage * 2} points of double damage!\n"
    # This is why we can call attacker.crit_attack. crit_attack is a class method from Character which Rogue, Mage, and Warrior all inherit from. Enemy also has crit_attack as class method.
    attacker.crit_attack(defender)
  else
    puts "#{attacker.name} attacks #{defender.name} with a #{attacker.weapon} for #{attacker.damage} damage!!\n"
    attacker.attack(defender)
  end
  puts "#{defender.name}'s health: #{defender.health.round(1)}" if defender.health >= 0
  attacker.weapon = attacker.class.weapons.keys.sample
  sleep(2)
end

#Same idea with offhand attack. Another instance method. 
def offhand_attack(attacker, defender)
  puts "#{attacker.name} strikes #{defender.name} with their offhand #{attacker.weapon} for extra damage!\n"
  attacker.offhand_attack(defender)
  puts "#{defender.name}'s health: #{defender.health.round(1)}\n" if defender.health >= 0
  attacker.weapon = attacker.class.weapons.keys.sample
  sleep(2)
end

########################################################
# GAME START
puts "Who is player 1?"
name_one = gets.chomp
puts "What role is your fighter? Mage, Warrior, or Rogue?"
role = gets.chomp
arena = Arena.new(@monsters)

player_one = create_player(name_one, role)
# Create new instance of Enemy and assign to variable
enemies = arena.monsters

puts "*************************************"
puts "Welcome to the Arena!"
puts "*************************************"
monster_names = arena.monsters.map(&:name)
last_monster = monster_names.pop

puts "Battling today #{player_one.name} will fight #{monster_names.join(', ')} and #{last_monster}"

puts
sleep(2)

puts "Fight!!!!!"
puts

def death_check(player_or_enemy, opponent)
  if player_or_enemy.dead?
    puts "#{opponent.name} is the winner!"
    puts "*************************************"
    return true
  end
  return false
end

def perform_combat(player, enemy, role)
  attack(enemy, player)
  return if death_check(player, enemy)

  attack(player, enemy)
  return if death_check(enemy, player)

  offhand_attack(player, enemy) if role == "Rogue"
  death_check(enemy, player)
end
arena.inspect

enemies.each do |enemy|
  puts "Up now we have #{player_one.name} the #{role} (#{player_one.health} HP) vs. #{enemy.name}! (#{enemy.health} HP)"
  perform_combat(player_one, enemy, role) until player_one.dead? || enemy.dead?
  player_one.health += 25
  break if player_one.dead?
end
