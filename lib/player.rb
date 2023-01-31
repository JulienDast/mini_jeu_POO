class Player

  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if life_points > 0
    "#{name} a #{life_points} points de vie."
    else 
    "#{name} a #{life_points} point de vie."
    end
  end

  def gets_damage(damage)
    @damage = damage
    @life_points = life_points - damage
    if @life_points <= 0
      puts "Le joueur #{name} a été tué !"
    end
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name} !"
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dommages."
    player.gets_damage(damage)  
  end
  
  def compute_damage
    return rand(1..6)
  end

end


class HumanPlayer < Player

  attr_accessor :weapon_level, :life_points

  def initialize(name)
    super
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level} !"
    if new_weapon_level > @weapon_level
       @weapon_level = new_weapon_level
       puts "Vamooooos ça c'est du lourd ! On prend !"
    elsif
       puts "Ah ouais c'est chaud... On passe notre chemin..."
    end
  end

  def search_health_pack
    new_life_points = rand(1..6)
    case new_life_points
      when 1
        puts "Dommage, tu n'as rien trouvé !"
      when 2..5
        @life_points += 50
        @life_points = 100 if @life_points > 100
          puts "Allez hop, 50 points pour Gryffondor !"
      when 6
        @life_points += 80
        @life_points = 100 if @life_points > 100
        puts "T'as beaucoup trop de chance, ça en devient suspect..."
      end
    end

end
