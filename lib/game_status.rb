# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # first column
  [1, 4, 7], # second column
  [2, 5, 8], # third column
  [0, 4, 8], # diagonal top-right to bottom left
  [2, 4, 6] # diagonal top-left to bottom right
]

#board_empty = board.all? {|position| position == nil || position == "" || position == " "}
#board_full = board.all? {|position| position == 'X' || position == 'O'}

# Checks if someone has won the game
def won?(board)

  win_array = []
  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == 'X' && position_2 == 'X' && position_3 == 'X') || (position_1 == 'O' && position_2 == 'O' && position_3 == 'O')
      return win_combination

      #win_array << win_index_1
      #win_array << win_index_2
      #win_array << win_index_3

      #return win_array
    end
  end
end


#checks if the board is full
def full?(board)
  board_full = board.all? {|position| position == 'X' || position == 'O'}

  if (board_full)
    return true
  else
    return false
  end
end


# checks if the game is a draw
def draw?(board)
  #full = full?(board) == true
  #won = won?(board) == true

  if full?(board) == true && won?(board) == false || won?(board) == []
    return true

  elsif won?(board) == true
    return false

  elsif won?(board) == false && full?(board) == false
    return false
  end
end

# Checks if the games has ended
def over?(board)
  if won?(board) == true || draw?(board) == true || (full?(board) == true)
    return true

  else
    return false
  end
end

# Outputs who won
def winner(board)
  number_of_x = board.select {|position| position == 'X'}
  number_of_o = board.select {|position| position == 'O'}

  if (won?(board) == true)
    if number_of_x > number_of_o
      return 'X'
    else number_of_x < number_of_o
      return 'O'
    end

  else
    return nil
  end
  # puts "X: #{number_of_x.length} /// O: #{number_of_o.length}"
end



=begin
  random_array = []

  WIN_COMBINATIONS.each do |win_combination|
    count = 0
    while count < 8 do
      if (board_empty)
        return false

      elsif (board_full)
        if ((board[win_combination[0]] == true) && (board[win_combination[1]] == true) && (board[win_combination[2]] == true))
          random_array << win_combination[0]
          random_array << win_combination[1]
          random_array << win_combination[2]

          return random_array

        else
          return false

        end

      elsif ((position_taken?(board, win_combination[0]) == true) && (position_taken?(board, win_combination[1]) == true) && (position_taken?(board, win_combination[2]) == true))
        random_array << win_combination[0]
        random_array << win_combination[1]
        random_array << win_combination[2]

        return random_array

      else
        random_array = []
        count += 1
      end
    end
  end
end

=end

board1 = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
board2 = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
board3 = ["X", "X", "X", "O", "O", " ", " ", " ", " "]
board4 = ["O", "O", " ", "X", "X", "X", " ", " ", " "]
board5 = [" ", " ", " ", "O", "O", " ", "X", "X", "X"]
board6 = ["O", " ", "X", "O", " ", "X", "O", " ", " "]
board7 = ["X", "O", " ", "X", "O", " ", " ", "O", " "]
board8 = ["X", " ", "O", "X", " ", "O", " ", " ", "O"]
board9 = ["X", " ", "O", " ", "X", "O", " ", " ", "X"]
board10 = ["X", " ", "O", "X", "O", " ", "O", " ", " "]
board11 = ["X", "X", "X", "O", "X", "O", "O", "O", "X"]
board12 = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]

winner(board1)
winner(board2)
winner(board3)
winner(board4)
winner(board5)
winner(board6)
winner(board7)
winner(board8)
winner(board9)
winner(board10)
winner(board11)
winner(board12)


print "#{won?(board1)}\n"
print "#{won?(board2)}\n"
print "#{won?(board3)}\n"
print "#{won?(board4)}\n"
print "#{won?(board5)}\n"
print "#{won?(board6)}\n"
print "#{won?(board7)}\n"
print "#{won?(board8)}\n"
print "#{won?(board9)}\n"
print "#{won?(board10)}\n"
print "#{won?(board11)}\n"
print "#{won?(board12)}\n"
