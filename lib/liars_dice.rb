class Game

  attr_reader :players, :total_dice

  def initialize(players)
    @players = []
    @total_dice = players * 5
    create_players(players)
  end

  def move(id, dice, value)
    current_player = @players[id - 1]
    @total_dice = @total_dice - dice
    
    # simulating hand by adding in dice the player puts into the middle instead of random numbers
    dice.times do |i|
      current_player[:dice_rolled][i] = value
    end

    current_player = { id: id, dice_middle: dice, value: value, dice_left: current_player[:dice_left] - dice, dice_rolled: current_player[:dice_rolled] }
  end

  def claim(dice, value)
    if @total_dice > 1
      return (probability(@total_dice, @total_dice) + probability(@total_dice - 1.0, @total_dice)) * 100
    else
      return (probability(@total_dice, @total_dice)) * 100
    end
  end

  def challenge(dice, value)
    dice_remaining = []

    @players.each do |player|
      if player[:dice_rolled] = value
        dice_remaining.push(player[:dice_rolled])
      end
    end

    return dice_remaining.count == dice
  end

private

  def factorial(n)
    (1..n).inject(1, :*) 
  end
  
  #n! / k! (n - k)! * (1/6)^k * 5/6^(n-k)
  def probability(n, k)
    if k <= n
      return (factorial(n) / (factorial(k) * factorial(n - k))) * (1.0/6.0) ** k * (5.0/6.0) ** (n-k)
    else
      return 0.0
    end
  end

  # This is just to simulate having 5 dice on hand
  # These dice are overwritten if you are making a move manually in the move method
  def roll
    dice_rolled = []
    5.times { dice_rolled.push rand(1..6) }

    return dice_rolled
  end

  def create_players(amount)
    player_count = (1..amount).to_a

    player_count.each do |i|
      player = { id: i, dice_middle: 0, value: 0, dice_left: 5, dice_rolled: roll }
      @players << player
    end
  end
end
