require "./function"
class Variable
    getter grad, creator 
  def initialize(data : Matrix)
    @data = data
    #@grad = 
   # @creator : Function = nil
  end

  def set_creator(func : Function)
    @creator  = func
  end

  def backward
    f = @creator
    while (f)
        f.input.grad = f.backward(f.output.grad)
        f = f.input.creator
    end
  end
end
