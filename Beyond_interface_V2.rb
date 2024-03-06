require_relative 'Beyond_thunderdome'

puts "Who is player 1?"
name_one = gets.chomp
puts "What role is your fighter? Mage, Warrior, or Rogue?"
role_one = gets.chomp
if role_one == "Warrior"
    player_one = Warrior.new(name_one, Warrior.weapons.keys.sample)
  elsif role_one == "Mage"
    player_one = Mage.new(name_one, Mage.weapons.keys.sample)
  elsif role_one == "Rogue"
    player_one = Rogue.new(name_one, Rogue.weapons.keys.sample)
  else
    puts "I'm sorry, I do not understand."
end



puts "Who is player 2?"
name_two = gets.chomp
puts "What role is your fighter? Mage, Warrior, or Rogue?"
role_two = gets.chomp
if role_two == "Warrior"
    player_two = Warrior.new(name_two, Warrior.weapons.keys.sample)
  elsif role_two == "Mage"
   player_two = Mage.new(name_two, Mage.weapons.keys.sample)
  elsif role_two == "Rogue"
    player_two = Rogue.new(name_two, Rogue.weapons.keys.sample)
  else
  puts "I'm sorry, I do not understand."
end

puts "*************************************"
puts "Welcome to the Le Wagon Thunderdome!"
puts "*************************************"
puts "Battling today, we have #{player_one.name} the #{role_one} vs. 
#{player_two.name} the #{role_two}!"
puts
sleep(2)

puts "Fight!!!!!"
puts
until player_one.dead? || player_two.dead?
  case role_one
  when "Warrior"
    crit_chance = rand(1..10)
      if crit_chance.between?(8,10)
        puts "#{player_one.name} lands a critical hit on #{player_two.name} with a #{player_one.weapon} for double damage(#{player_one.damage})!"
        player_one.critattack(player_two)
        puts "#{player_two.name}'s health: #{player_two.health}"
        player_one.weapon = Warrior.weapons.keys.sample
        sleep(2)
        crit_chance = nil
      else
        puts "#{player_one.name} attacks #{player_two.name} with a #{player_one.weapon} for #{player_one.damage} damage!"
        sleep(2)
        player_one.attack(player_two)
        puts "#{player_two.name}'s health: #{player_two.health}"
        player_one.weapon = Warrior.weapons.keys.sample
        puts
        sleep(2)
      end
  when "Mage"
    crit_chance = rand(1..10)
    if crit_chance == 10
      puts "#{player_one.name} lands a critical hit on #{player_two.name} with a #{player_one.weapon} for double damage(#{player_one.damage})!"
      player_one.critattack(player_two)
      puts "#{player_two.name}'s health: #{player_two.health}"
      player_one.weapon = Mage.weapons.keys.sample
      sleep(2)
      puts
      crit_chance = nil
    else     
      puts "#{player_one.name} attacks #{player_two.name} with a #{player_one.weapon} for #{player_one.damage} damage!"
      sleep(2)
      player_one.attack(player_two)
      puts "#{player_two.name}'s health: #{player_two.health}"
      player_one.weapon = Mage.weapons.keys.sample
      puts
      sleep(2)
    end
  when "Rogue"
    crit_chance = rand(1..10)
    if crit_chance.between?(5,10)
      puts "#{player_one.name} lands a critical hit on #{player_two.name} with a #{player_one.weapon} for double damage(#{player_one.damage})!"
      player_one.critattack(player_two)
      puts "#{player_two.name}'s health: #{player_two.health}"
      player_one.weapon = Rogue.weapons.keys.sample
      sleep(2)
      puts
      crit_chance = nil
    else     
      puts "#{player_one.name} attacks #{player_two.name} with a #{player_one.weapon} for #{player_one.damage} damage!"
      sleep(2)
      player_one.attack(player_two)
      puts "#{player_two.name}'s health: #{player_two.health}"
      sleep(2)
      player_one.weapon = Rogue.weapons.keys.sample
      puts
      player_one.offhandattack(player_two)
      puts "#{player_one.name} strikes #{player_two.name} with their offhand #{player_one.weapon} for #{player_one.damage} damage!"
      puts "#{player_two.name}'s health drops to #{player_two.health}"
      player_one.weapon = Rogue.weapons.keys.sample
      puts
      sleep(2)
    end
  else 
    puts "Critical error here in block 1."
    sleep(5)
  end
unless player_two.dead?
    case role_two
    when "Warrior"
      crit_chance = rand(1..10)
      if crit_chance.between?(8,10)
        puts "#{player_two.name} lands a critical hit on #{player_one.name} with a #{player_two.weapon} for double damage(#{player_two.damage})!"
        player_two.critattack(player_one)
        puts "#{player_one.name}'s health: #{player_one.health}"
        player_two.weapon = Warrior.weapons.keys.sample
        sleep(2)
        puts
        crit_chance = nil
      else     
        puts "#{player_two.name} attacks #{player_one.name} with a #{player_two.weapon} for #{player_two.damage} damage!"
        sleep(2)
        player_two.attack(player_one)
        puts "#{player_one.name}'s health: #{player_one.health}"
        puts
        player_two.weapon = Warrior.weapons.keys.sample
      end
    when "Mage"
      crit_chance = rand(1..10)
      if crit_chance == 10
        puts "#{player_two.name} lands a critical hit on #{player_one.name} with a #{player_two.weapon} for double damage(#{player_two.damage})!"
        player_two.critattack(player_one)
        puts "#{player_one.name}'s health: #{player_one.health}"
        player_two.weapon = Mage.weapons.keys.sample
        sleep(2)
        puts
        crit_chance = nil
      else     
        puts "#{player_two.name} attacks #{player_one.name} with a #{player_two.weapon} for #{player_two.damage} damage!"
        sleep(2)
        player_two.attack(player_one)
        puts "#{player_one.name}'s health: #{player_one.health}"
        puts
        player_two.weapon = Mage.weapons.keys.sample
      end
    when "Rogue"
      crit_chance = rand(1..10)
      if crit_chance.between?(5, 10)
        puts "#{player_two.name} lands a critical hit on #{player_one.name} with a #{player_two.weapon} for double damage(#{player_two.damage})!"
        player_two.critattack(player_one)
        puts "#{player_one.name}'s health: #{player_one.health}"
        player_two.weapon = Rogue.weapons.keys.sample
        sleep(2)
        puts
        crit_chance = nil
      else     
        puts "#{player_two.name} attacks #{player_one.name} with a #{player_two.weapon} for #{player_two.damage} damage!"
        sleep(2)
        player_two.attack(player_one)
        puts "#{player_one.name}'s health: #{player_one.health}"
        player_two.weapon = Rogue.weapons.keys.sample
        puts
        player_two.offhandattack(player_one)
        puts "#{player_two.name} strikes #{player_one.name} with their offhand #{player_two.weapon} for extra damage(#{player_two.damage})!"
        puts "#{player_one.name}'s health drops to #{player_one.health}"
        puts
        player_two.weapon = Rogue.weapons.keys.sample
      end
    else
      puts "Critical error in block 2."
      sleep(5)
    end
  end
end

if player_one.health > player_two.health
  puts "#{player_one.name} is the winner!"
elsif player_two.health > player_one.health
  puts "#{player_two.name} is the winner!"
else
  puts "Everyone is dead...."
end