class Game 

  def initialize
    @current_player = nil
  end

  # Create 2 new players
  def create_players
    puts "Player 1 Name: "
    player1 = $stdin.gets.chomp
    @player1 = Player.new(player1)
    puts "Player 2 Name: "
    player2 = $stdin.gets.chomp
    @player2 = Player.new(player2)

    puts "It's the #{@player1.name} and #{@player2.name} maths quiz!"
  end

  # Switches the current player after each question
  def set_current_player
    if @current_player == nil
      @current_player = @player1
    elsif @current_player == @player1
      @current_player = @player2
    else @current_player == @player2
      @current_player = @player1
    end
    @current_player
  end
  
  def play_game
    create_players

    # Runs each round of questions... 
    loop do
      # New round begins
      self.set_current_player

      new_question = Question.new(@current_player)

      print "#{@current_player.name}: "
      new_question.ask_question
      answer = $stdin.gets.chomp

      # Checks user input against total
      if new_question.evaluate_answer(answer)
        puts "Yes that's correct!"
      else
        puts "Whoops, no that's not right."
        @current_player.lose_life
      end

      # ...until someone loses all 3 lives
      if @current_player.lives == 0
        announce_winner
        break
      else
        puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
      end

    end
  end

  def announce_winner
    if @current_player == @player1
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3!"
      puts "Good bye!"
    else 
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3!"
      puts "Good bye!"
    end
  end

end