def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def input_to_index(input) #helper method to change user's input
  input.to_i - 1
end

def position_taken? (board, index)
  if board[index] == "" or board[index] == " " or board[index] == nil
    false
  elsif board[index] == "X" or board[index] == "O"
    true
  end
end

def move (board, index, current_player = "X")
  board[index] = current_player
end

def turn(board)
  puts "Please enter 1-9:"              # ask for user input
  input = gets.to_i                     # gets user input
  index = input_to_index(input)         # calls method to change input to index
  if valid_move?(board, index)          # if condition true then call the two methods
    move(board, index, current_player="X")
  else turn(board)                      #if condition is false then recursion
    display_board
  end
end
