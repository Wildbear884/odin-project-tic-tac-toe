require_relative "lib/board"
require_relative "lib/game"
require_relative "lib/player"

puts <<~WELCOME_TEXT
  Welcome to the game of tic tac toe AKA noughts and crosses or Xs and Os!

  The game starts out by asking who is playing as “X” and who is playing as “O”.
  Then you the players must decide who is going start.

  The rules are simple.
  The starting player places their piece in an empty space on a three by three
  grid.

  The next player places their piece in an empty place on the grid.

  Players continue taking turns until one player wins or the board is full.

  Players can win by having three of their pieces in a row that is either
  horizontal, vertical or diagonal.

  If the board is full and no player has gotten three pieces in a row then the
  game ends in a tie.

  All right that's it, have fun playing!

WELCOME_TEXT

TicTacToe::Game.new.play
