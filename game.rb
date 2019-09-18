class Game
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = "Player1"
    give_question
  end

  def game_over_or_continue
    check_winner
    continue_game unless @winner
  end

  def continue_game
    swap_player
    Display.say :new_turn
    give_question
  end

  def check_winner
    @winner = @player2 if @player1.alive_or_dead
    @winner = @player1 if @player2.alive_or_dead
    winner if @winner
  end

  def winner
    puts "#{@winner.name} wins with a score of #{@winner.lives} lives"
    Display.say :game_over
    Display.say :good_bye
  end

  def give_question
    @random_number = rand(1..20)
    @random_number2 = rand(1..20)
    puts "#{@turn} What does #{@random_number} plus #{@random_number2} equal?"
    check_answer
  end

  def check_answer
    original_answer = @random_number + @random_number2
    user_answer = gets.chomp.to_i
    if user_answer == original_answer
      puts "#{@turn}: Congrats! You are correct!"
    else
      puts "#{@turn}: Seriously? No!"
      if @turn == @player1.name
        @player1.reduce_life
      else
        @player2.reduce_life
      end
    end
    puts "#{@player1.name}: #{@player1.lives} vs #{@player2.name}: #{@player2.lives}"
    game_over_or_continue
  end

  def swap_player
    if @turn == "Player1"
      @turn = "Player2"
    else
      @turn = "Player1"
    end
  end
end
