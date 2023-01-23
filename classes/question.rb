class Question

  attr_accessor :total

  def initialize(current_player)
    random_numbers
    total
  end

  def random_numbers
    @value1 = rand(20)
    @value2 = rand(20)
  end

  def total
    @total = @value1 + @value2
  end

  def ask_question
    puts "What does #{@value1} plus #{@value2} equal?"
    # @answer = $stdin.gets.chomp
    # evaluate_answer
  end

  def evaluate_answer(answer)
    answer.to_i == @total
  end

  # def evaluate_answer
  #   if @answer.to_i != @total
  #     puts "Whoops, no that's not right."
  #     @current_player.lose_life
  #   else
  #     puts "Yes that's correct!"
  #   end
  # end
end