**Liars Dice**
==============

First clone this repo and change directory to the root of the Liars Dice.

To launch Liars Dice, open an IRB session from your console.

    > load './lib/liars_dice.rb'

**To init a game:**

    > game = Game.new(4)

You can input any amount of players. In the above example we have initiated the game with four players. The players are initialized in order from 1 to 4.

**To make a move once the game is initialized**

Use the move method which takes three arguments in this order (player id, dice amount, dice value):

    
    > game.move(1,3,2)

This move represents player 1, who puts 3 dice into the middle with a value of 2.

**To make a claim during a game**

Use the claim method which takes two arguments in this order (dice amount, dice value)

    > game.claim(19,3)
  
This claim is a bet to see the percentage chance that there are 19 dice with a value of 3 which is highly unlikely.

**To make a challenge during a game**

Use the challenge method which takes two arguments in this order (dice amount, value)

    > game.challenge(19,3)

This challenge goes against the game to see whether you are right or wrong about how many dice and their value are in the middle. In this case, it would most likely be false.


==============


To run the tests and specs for this repo, run rake from the command line.