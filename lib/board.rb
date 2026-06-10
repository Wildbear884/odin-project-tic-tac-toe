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

    ENDING_COMBINATIONS = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ].freeze

    def initialize
      @board = %w[_ _ _ _ _ _ _ _ _]
      @empty_spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    end

    def display
      [0, 3, 6].each { |n| puts @board[n, 3].join(" ") }
    end

    def place(piece)
      placement_number = placement_name_to_number(placement)
      @empty_spaces[placement_number] = ""
      @board[placement_number] = piece
    end

    def full?
      @board.none?("_")
    end

    private

    def placement_name_to_number(placement_text)
      number = 0

      PLACEMENT_NAMES.each do |a|
        break if a.include?(placement_text)

        number += 1
      end
      number
    end

    def placement
      place = ""
      until valid_placement?(place)
        puts "Where would you like to place?"
        place = gets.chomp.downcase
        valid_placement_names if place == "valid placement names"
        display if place == "board"
        puts invalid_placement_text(place) unless placement_or_command?(place)
      end
      place
    end

    def valid_placement?(place)
      valid_placement_name?(place) && space_empty?(place)
    end

    def invalid_placement_text(place)
      if !valid_placement_name?(place)
        <<~INVALID_TEXT
          That is not a valid placement name.
          Type “valid placement names” to see all valid placement names.
        INVALID_TEXT
      elsif !space_empty?(place)
        "That spot is already occupied.\nType “board” to view the board"
      end
    end

    def space_empty?(place)
      @empty_spaces.include?(placement_name_to_number(place))
    end

    def valid_placement_name?(place)
      PLACEMENT_NAMES.flatten.include?(place)
    end

    def valid_placement_names
      puts "\nThese are all the valid placement names:"
      PLACEMENT_NAMES.each { |a| puts a.join(", ") }
    end

    def placement_or_command?(input)
      valid_placement?(input) ||
        ["board", "valid placement names"].include?(input)
    end

    def winner?
      return false unless @board.count("X") >= 3 || @board.count("O") >= 3

      ENDING_COMBINATIONS.each do |a|
        selection = @board.fetch_values(a[0], a[1], a[2])
        return true if selection.all?("X") || selection.all?("O")
      end
      false
    end
  end
end
