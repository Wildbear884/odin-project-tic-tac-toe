module TicTacToe
  # Players are used to play games, they store their name and piece type.
  class Player
    attr_reader :name, :piece

    def initialize(piece)
      @piece = piece
      @name = player_name
    end

    private

    def player_name
      puts "Please enter a name for the player who is playing as #{@piece}."
      gets.chomp
    end
  end
end
