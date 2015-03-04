class Calculator
  attr_accessor :result

  def add(num1,num2)
    @result = 0
    @result = num1 + num2
  end

  def subtract(num1,num2)
    @result = num1 - num2
  end

  def square(num)
    @result = num **2
  end

  def divide(num1, num2)
    @result = num1 / num2
  end

  def multiply(num1, num2)
    @result = num1 * num2
  end

  def x_to_y(num1, num2)
    @result = num1 ** num2
  end

  def last_result
    @result
  end

  def clear
    @result = 0
  end


end
