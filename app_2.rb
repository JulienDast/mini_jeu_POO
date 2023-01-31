require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "-----------------------------------------------"
puts "        Salut à toi jeune développeur !        "
puts "       Tu veux dégommer Josiane et José ?      "
puts "      La question elle est vite répondue !     "
puts "-----------------------------------------------"

puts "Quel est ton prénom ? Ou pseudo ? Ou blaze ? bref"
print ">"
user_name = gets.chomp.to_s
user = HumanPlayer.new("#{user_name}")
puts "T'aimes la castagne, #{user_name} ? Alors bienvenue à toi petit loubard !"
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = []
enemies << player1
enemies << player2
gets.chomp
puts
puts "*****************************************************************"

while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
  gets.chomp
  puts "Voici l'état de ta santé physique et mentale :"
  puts  user.show_state
  puts 
  puts "Alors,on fait quoi ?"
  puts "<a> On tente de trouver une meilleure arme"
  puts "<s> On passe vite fait à l'hosto, c'est chaud là"
  puts
  puts "Ou tu préfères bourriner ?"
  if player1.life_points > 0
    puts "<0> Josiane a '#{player1.show_state}'"
  end
  if player2.life_points > 0
  puts "<1> José a '#{player2.show_state}'"
  end
  puts "--------------------------------------------------------------"
  print ">"
  choice = gets.chomp
  if choice == "a"
    user.search_weapon
    gets.chomp
  elsif choice == "s"
    user.search_health_pack
    gets.chomp
  elsif choice == "0"
    user.attacks(player1)
    gets.chomp
  elsif choice == "1"
    user.attacks(player2)
    gets.chomp
  elsif choice != "a" || choice != "s" || choice != "0" || choice != "1"
    puts "Privé de bagarre, va dans ta chambre et attends le tour suivant."
    gets.chomp
  end  
  puts "C'est à ton tour de te faire bastonner !"
  puts
  enemies.each { |n| n.attacks(user) if n.life_points>0 }
  if user.life_points <= 0
    break
  end

end

puts "On dirait bien que nous avons un vainqueur..."
if user.life_points >0
  puts "Il y a pas eu match, t'es trop fort, je t'aime."
  puts "--------------------------------------------------------------"
else
  puts "T'as perdu alors que t'avais une arme...rdv sur le parking d'Intermarché à 19h, on va régler ça à l'ancienne..."
  puts "--------------------------------------------------------------"
end