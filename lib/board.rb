module TicTacToe
  # Board is how the tic tac toe boards are created.
  class Board
    PLACEMENT_NAMES = [
      ["top left", "left top", "1"],
      ["top middle", "middle top", "top center", "center top", "2"],
      ["top right", "right top", "3"],
      ["middle left", "left middle", "center left", "left center", "4"],
      %w[middle center 5],
      ["middle right", "right middle", "center right", "right center", "6"],
      ["bottom left", "left bottom", "7"],
      ["bottom middle", "middle bottom", "bottom center", "middle bottom", "8"],
      ["bottom right", "right bottom", "9"]
    ].freeze

    def initialize
      @board = %w[_ _ _ _ _ _ _ _ _ _]
    end

    def display
      [0, 3, 6].each { |n| puts @board[n, 3].join(" ") }
    end

    def place(piece, placement)
      @board[placement_name_to_number(placement)] = piece
    end

    private

    def placement_name_to_number(placement_text)
      number = 0

      PLACEMENT_NAMES.each_with_index do |_a, e|
        number = e
        break if PLACEMENT_NAMES[e].include?(placement_text)
      end
      number
    end
  end
end
