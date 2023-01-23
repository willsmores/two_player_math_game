class Question

  attr_accessor :total

  def initialize
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
  end

  def evaluate_answer(answer)
    answer.to_i == @total
  end

end